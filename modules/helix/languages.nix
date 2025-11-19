{
  language-server = {
    rust-analyzer = {
      command = "rust-analyzer";

      config.inlayHints = {
        bindingModeHints.enable = false;
        closingBraceHints.minLines = 10;
        closureReturnTypeHints.enable = "with_block";
        discriminantHints.enable = "fieldless";
        lifetimeElisionHints.enable = "skip_trivial";
        typeHints.hideClosureInitialization = false;
      };
    };
    clangd = {
      command = "clangd";
      args = [
        "--clang-tidy"
        "--fallback-style=Google"
        "--header-insertion=never"
        "--query-driver=/usr/bin/clang++"
        "--compile_args_from=filesystem"
      ];
    };
  };

  grammar = [
    {
      name = "rust";
      source = { git = "https://github.com/tree-sitter/tree-sitter-rust"; rev = "261b20226c04ef601adbdf185a800512a5f66291"; };
    }
    {
      name = "c";
      source = { git = "https://github.com/tree-sitter/tree-sitter-c"; rev = "7175a6dd5fc1cee660dce6fe23f6043d75af424a"; };
    }
    {
      name = "cpp";
      source = { git = "https://github.com/tree-sitter/tree-sitter-cpp"; rev = "master"; };
    }
    {
      name = "zig";
      source = { git = "https://github.com/tree-sitter-grammars/tree-sitter-zig"; rev = "eb7d58c2dc4fbeea4745019dee8df013034ae66b"; };
    }
    {
      name = "javascript";
      source = { git = "https://github.com/tree-sitter/tree-sitter-javascript"; rev = "f772967f7b7bc7c28f845be2420a38472b16a8ee"; };
    }
    {
      name = "typescript";
      source = { git = "https://github.com/tree-sitter/tree-sitter-typescript"; rev = "b1bf4825d9eaa0f3bdeb1e52f099533328acfbdf"; subpath = "typescript"; };
    }
    {
      name = "tsx";
      source = { git = "https://github.com/tree-sitter/tree-sitter-typescript"; rev = "b1bf4825d9eaa0f3bdeb1e52f099533328acfbdf"; subpath = "tsx"; };
    }
    {
      name = "css";
      source = { git = "https://github.com/tree-sitter/tree-sitter-css"; rev = "769203d0f9abe1a9a691ac2b9fe4bb4397a73c51"; };
    }
    {
      name = "scss";
      source = { git = "https://github.com/serenadeai/tree-sitter-scss"; rev = "c478c6868648eff49eb04a4df90d703dc45b312a"; };
    }
    {
      name = "php";
      source = { git = "https://github.com/tree-sitter/tree-sitter-php"; rev = "f860e598194f4a71747f91789bf536b393ad4a56"; };
    }
    {
      name = "nasm";
      source = { git = "https://github.com/naclsn/tree-sitter-nasm"; rev = "570f3d7be01fffc751237f4cfcf52d04e20532d1"; };
    }
    {
      name = "c-sharp";
      source = { git = "https://github.com/tree-sitter/tree-sitter-c-sharp"; rev = "b5eb5742f6a7e9438bee22ce8026d6b927be2cd7"; };
    }
  ];

  languages = [
    {
      name = "rust";
      scope = "source.rust";
      injection-regex = "rs|rust";
      language-id = "rust";
      auto-format = true;
      file-types = ["rs"];
      shebangs = ["cargo" "rust-script"];
      roots = ["Cargo.lock" "Cargo.toml"];
      diagnostic-severity = "hint";
      comment-tokens = ["//" "///" "//!"];
      block-comment-tokens = [
        { start = "/*"; end = "*/"; }
        { start = "/**"; end = "*/"; }
        { start = "/*!"; end = "*/"; }
      ];
      language-servers = ["rust-analyzer"];
      indent = { tab-width = 4; unit = "    "; };
      persistent-diagnostic-sources = ["rustc" "clippy"];

      auto-pairs = {
        "(" = ")";
        "{" = "}";
        "[" = "]";
        "\"" = "\"";
        "`" = "`";
      };

      debugger = {
        name = "lldb-dap";
        transport = "stdio";
        command = "lldb-dap";

        templates = [
          {
            name = "binary";
            request = "launch";
            completion = [ { name = "binary"; completion = "filename"; } ];
            args = { program = "{0}"; };
          }
          {
            name = "binary (terminal)";
            request = "launch";
            completion = [ { name = "binary"; completion = "filename"; } ];
            args = { program = "{0}"; runInTerminal = true; };
          }
          {
            name = "attach";
            request = "attach";
            completion = [ "pid" ];
            args = { pid = "{0}"; };
          }
          {
            name = "gdbserver attach";
            request = "attach";
            completion = [ { name = "lldb connect url"; default = "connect://localhost:3333"; } { name = "file"; completion = "filename"; } "pid" ];
            args = { attachCommands = [ "platform select remote-gdb-server" "platform connect {0}" "file {1}" "attach {2}" ]; };
          }
        ];
      };
    }
    {
      name = "c";
      scope = "source.c";
      injection-regex = "c";
      file-types = ["c"]; # TODO: ["h"]
      comment-token = "//";
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "clangd" ];
      indent = { tab-width = 2; unit = "  "; };

      language.debugger = {
        name = "lldb-dap";
        transport = "stdio";
        command = "lldb-dap";

        templates = [
          {
            name = "binary";
            request = "launch";
            completion = [ { name = "binary"; completion = "filename"; } ];
            args = { console = "internalConsole"; program = "{0}"; };
          }
          {
            name = "attach";
            request = "attach";
            completion = [ "pid" ];
            args = { console = "internalConsole"; pid = "{0}"; };
          }
          {
            name = "gdbserver attach";
            request = "attach";
            completion = [ { name = "lldb connect url"; default = "connect://localhost:3333"; } { name = "file"; completion = "filename"; } "pid" ];
            args = { console = "internalConsole"; attachCommands = [ "platform select remote-gdb-server" "platform connect {0}" "file {1}" "attach {2}" ]; };
          }
        ];
      };
    }
    {
      name = "cpp";
      scope = "source.cpp";
      injection-regex = "cpp";
      file-types = ["cc" "hh" "c++" "cpp" "hpp" "h" "ipp" "tpp" "cxx" "hxx" "ixx" "txx" "ino" "C" "H" "cu" "cuh" "cppm" "h++" "ii" "inl" { glob = ".hpp.in"; } { glob = ".h.in"; }];
      comment-token = "//";
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "clangd" ];
      indent = { tab-width = 2; unit = "  "; };

      debugger = {
        name = "lldb-dap";
        transport = "stdio";
        command = "lldb-dap";

        templates = [
          {
            name = "binary";
            request = "launch";
            completion = [ { name = "binary"; completion = "filename"; } ];
            args = { console = "internalConsole"; program = "{0}"; };
          }
          {
            name = "attach";
            request = "attach";
            completion = [ "pid" ];
            args = { console = "internalConsole"; pid = "{0}"; };
          }
          {
            name = "gdbserver attach";
            request = "attach";
            completion = [ { name = "lldb connect url"; default = "connect://localhost:3333"; } { name = "file"; completion = "filename"; } "pid" ];
            args = { console = "internalConsole"; attachCommands = [ "platform select remote-gdb-server" "platform connect {0}" "file {1}" "attach {2}" ]; };
          }
        ];
      };
    }
    {
      name = "zig";
      scope = "source.zig";
      injection-regex = "zig";
      file-types = ["zig" "zon"];
      roots = ["build.zig"];
      auto-format = true;
      comment-tokens = ["//" "///" "//!"];
      language-servers = ["zls"];
      indent = { tab-width = 4; unit = "    "; };
      formatter = { command = "zig"; args = ["fmt" "--stdin"]; };

      debugger = {
        name = "lldb-dap";
        transport = "stdio";
        command = "lldb-dap";

        templates = [
          {
            name = "binary";
            request = "launch";
            completion = [ { name = "binary"; completion = "filename"; } ];
            args = { console = "internalConsole"; program = "{0}"; };
          }
          {
            
            name = "attach";
            request = "attach";
            completion = [ "pid" ];
            args = { console = "internalConsole"; pid = "{0}"; };
          }
          {
            name = "gdbserver attach";
            request = "attach";
            completion = [ { name = "lldb connect url"; default = "connect://localhost:3333"; } { name = "file"; completion = "filename"; } "pid" ];
            args = { console = "internalConsole"; attachCommands = [ "platform select remote-gdb-server""platform connect {0}" "file {1}" "attach {2}" ]; };
          }
        ];
      };
    }
    {
      name = "javascript";
      scope = "source.js";
      injection-regex = "(js|javascript)";
      language-id = "javascript";
      file-types = ["js" "mjs" "cjs" "rules" "es6" "pac" { glob = ".node_repl_history"; } { glob = "jakefile"; }];
      shebangs = ["node"];
      roots = [ "package.json" ];
      comment-token = "//";
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "typescript-language-server" ];
      indent = { tab-width = 2; unit = "  "; };

      debugger = {
        name = "node-debug2";
        transport = "stdio";
        quirks = { absolute-paths = true; };

        templates = [
          {
            name = "source";
            request = "launch";
            completion = [ { name = "main"; completion = "filename"; default = "index.js"; } ];
            args = { program = "{0}"; };
          }
        ];
      };
    }
    {
      name = "typescript";
      scope = "source.ts";
      injection-regex = "(ts|typescript)";
      language-id = "typescript";
      file-types = ["ts" "mts" "cts"];
      shebangs = ["deno" "bun" "ts-node"];
      roots = [ "package.json" "tsconfig.json" ];
      comment-token = "//";
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "typescript-language-server" ];
      indent = { tab-width = 2; unit = "  "; };
    }
    {
      name = "jsx";
      scope = "source.jsx";
      injection-regex = "jsx";
      language-id = "javascriptreact";
      file-types = ["jsx"];
      roots = [ "package.json" ];
      comment-token = "//";
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "typescript-language-server" ];
      indent = { tab-width = 2; unit = "  "; };
      grammar = "javascript";
    }
    {
      name = "tsx";
      scope = "source.tsx";
      injection-regex = "(tsx)";
      language-id = "typescriptreact";
      file-types = ["tsx"];
      roots = [ "package.json" "tsconfig.json" ];
      comment-token = "//";
      indent = { tab-width = 2; unit = "  "; };
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "typescript-language-server" ];
    }
    {
      name = "css";
      scope = "source.css";
      injection-regex = "css";
      file-types = ["css"];
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "vscode-css-language-server" ];
      auto-format = true;
      indent = { tab-width = 2; unit = "  "; };
    }
    {
      name = "scss";
      scope = "source.scss";
      injection-regex = "scss";
      file-types = ["scss"];
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "vscode-css-language-server" ];
      auto-format = true;
      indent = { tab-width = 2; unit = "  "; };
    }
    {
      name = "php";
      scope = "source.php";
      injection-regex = "php";
      file-types = ["php" "inc" "php4" "php5" "phtml" "ctp"];
      shebangs = ["php"];
      roots = ["composer.json" "index.php"];
      comment-token = "//";
      block-comment-tokens = [{start = "/**"; end = "*/";} {start = "/*"; end = "*/";}];
      language-servers = [ "intelephense" ];
      indent = { tab-width = 4; unit = "    "; };
    }
    {
      name = "nasm";
      scope = "source.nasm";
      file-types = ["asm" "s" "S" "nasm"];
      injection-regex = "n?asm";
      comment-token = ";";
      indent = { tab-width = 4; unit = "    "; };
      language-servers = ["asm-lsp"];
    }
    {
      name = "c-sharp";
      scope = "source.csharp";
      injection-regex = "c-?sharp";
      file-types = ["cs" "csx" "cake"];
      roots = ["sln" "csproj"];
      comment-token = "//";
      block-comment-tokens = { start = "/*"; end = "*/"; };
      indent = { tab-width = 4; unit = "\t"; };
      language-servers = [ "omnisharp" ];

      debugger = {
        name = "netcoredbg";
        transport = "tcp";
        command = "netcoredbg";
        args = [ "--interpreter=vscode" ];
        port-arg = "--server={}";

        templates = [
          {
            name = "launch";
            request = "launch";
            completion = [ { name = "path to dll"; completion = "filename"; } ];
            args = { type = "coreclr"; console = "internalConsole"; internalConsoleOptions = "openOnSessionStart"; program = "{0}"; };
          }
          {
            name = "attach";
            request = "attach";
            completion = [ "pid" ];
            args = { processId = "{0}"; };
          }
        ];
      };
    }
  ];
}
