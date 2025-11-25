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
    emmet-lsp = {
      command = "emmet-language-server";
      args = ["--stdio"];
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
      name = "nix";
      source = { git = "https://github.com/nix-community/tree-sitter-nix"; rev = "1b69cf1fa92366eefbe6863c184e5d2ece5f187d"; };
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
      name = "vue";
      source = { git = "https://github.com/ikatyang/tree-sitter-vue"; rev = "91fe2754796cd8fba5f229505a23fa08f3546c06"; };
    }
    {
      name = "tsx";
      source = { git = "https://github.com/tree-sitter/tree-sitter-typescript"; rev = "b1bf4825d9eaa0f3bdeb1e52f099533328acfbdf"; subpath = "tsx"; };
    }
    {
      name = "html";
      source = { git = "https://github.com/tree-sitter/tree-sitter-html"; rev = "cbb91a0ff3621245e890d1c50cc811bffb77a26b"; };
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
    {
      name = "python";
      source = { git = "https://github.com/tree-sitter/tree-sitter-python"; rev = "293fdc02038ee2bf0e2e206711b69c90ac0d413f"; };
    }
    {
      name = "bash";
      source = { git = "https://github.com/tree-sitter/tree-sitter-bash"; rev = "487734f87fd87118028a65a4599352fa99c9cde8"; };
    }
    {
      name = "make";
      source = { git = "https://github.com/alemuller/tree-sitter-make"; rev = "a4b9187417d6be349ee5fd4b6e77b4172c6827dd"; };
    }
    {
      name = "cmake";
      source = { git = "https://github.com/uyha/tree-sitter-cmake"; rev = "6e51463ef3052dd3b328322c22172eda093727ad"; };
    }
    {
      name = "go";
      source = { git = "https://github.com/tree-sitter/tree-sitter-go"; rev = "12fe553fdaaa7449f764bc876fd777704d4fb752"; };
    }
    {
      name = "gomod";
      source = { git = "https://github.com/camdencheek/tree-sitter-go-mod"; rev = "6efb59652d30e0e9cd5f3b3a669afd6f1a926d3c"; };
    }
    {
      name = "gotmpl";
      source = { git = "https://github.com/ngalaiko/tree-sitter-go-template"; rev = "ca26229bafcd3f37698a2496c2a5efa2f07e86bc"; };
    }
    {
      name = "gowork";
      source = { git = "https://github.com/omertuc/tree-sitter-go-work"; rev = "6dd9dd79fb51e9f2abc829d5e97b15015b6a8ae2"; };
    }
    {
      name = "go-format-string";
      source = { git = "https://codeberg.org/kpbaks/tree-sitter-go-format-string"; rev = "06587ea641155db638f46a32c959d68796cd36bb"; };
    }
    {
      name = "sql";
      source = { git = "https://github.com/DerekStride/tree-sitter-sql"; rev = "b9d109588d5b5ed986c857464830c2f0bef53f18"; };
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
      formatter = { command = "rustfmt"; };
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
      name = "nix";
      scope = "source.nix";
      injection-regex = "nix";
      file-types = [ "nix" ];
      shebangs = [];
      comment-token = "#";
      language-servers = [ "nil" "nixd" ];
      indent = { tab-width = 2; unit = "  "; };
      formatter = { command = "nixfmt"; };
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
      name = "vue";
      scope = "source.vue";
      injection-regex = "vue";
      file-types = ["vue"];
      roots = ["package.json"];
      block-comment-tokens = { start = "<!--"; end = "-->"; };
      indent = { tab-width = 2; unit = "  "; };
      language-servers = [ "vuels" ];
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
      language-servers = [ "typescript-language-server" "emmet-lsp" ];
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
      language-servers = [ "typescript-language-server" "emmet-lsp" ];
    }
    {
      name = "html";
      scope = "text.html.basic";
      injection-regex = "html";
      file-types = [ "html" "htm" "shtml" "xhtml" "xht" "jsp" "asp" "aspx" "jshtm" "volt" "rhtml" "cshtml" ];
      block-comment-tokesn = { start = "<!--"; end = "-->"; };
      language-servers = [ "vscode-html-language-server" "superhtml" "emmet-lsp" ];
      auto-format = true;
      indent = { tab-width = 2; unit = "  "; };
      auto-pairs = {
        "(" = ")";
        "{" = "}";
        "[" = "]";
        "\"" = "\"";
        "'" = "'";
        "<" = ">";
      };
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
    {
      name = "python";
      scope = "source.python";
      injection-regex = "py(thon)?";
      file-types = [
        "py" "pyi" "py3" "pyw" "ptl" "rpy" "cpy" "ipy" "pyt"
        { glob = ".python_history"; }
        { glob = ".pythonstartup"; }
        { glob = ".pythonrc"; }
        { glob = "*SConstruct"; }
        { glob = "*SConscript"; }
        { glob = "*sconstruct"; }
      ];
      shebangs = [ "python" "uv" ];
      roots = [ "pyproject.toml" "setup.py" "poetry.lock" "pyrightconfig.json" ];
      comment-token = "#";
      language-servers = [ "ty" "ruff" "jedi" "pylsp" ];
      indent = { tab-width = 4; unit = "    "; };
    }
    {
      name = "bash";
      scope = "source.bash";
      injection-regex = "(shell|bash|zsh|sh)";
      file-types = [
        "sh"
        "bash"
        "ash"
        "dash"
        "ksh"
        "mksh"
        "zsh"
        "zshenv"
        "zlogin"
        "zlogout"
        "zprofile"
        "zshrc"
        "eclass"
        "ebuild"
        "bazelrc"
        "Renviron"
        "zsh-theme"
        "cshrc"
        "tcshrc"
        "bashrc_Apple_Terminal"
        "zshrc_Apple_Terminal"
        { glob = "i3/config"; }
        { glob = "sway/config"; }
        { glob = ".tmux.conf"; }
        { glob = "tmux.conf"; }
        { glob = ".sh_history"; }
        { glob = ".bash_history"; }
        { glob = ".bash_login"; }
        { glob = ".bash_logout"; }
        { glob = ".bash_profile"; }
        { glob = ".bashrc"; }
        { glob = ".profile"; }
        { glob = ".zshenv"; }
        { glob = ".zlogin"; }
        { glob = ".zlogout"; }
        { glob = ".zprofile"; }
        { glob = ".zshrc"; }
        { glob = ".zimrc"; }
        { glob = "APKBUILD"; }
        { glob = ".bash_aliases"; }
        { glob = "bash_completion"; }
        { glob = "bash-completion/completions/*"; }
        { glob = "bash_completion.d/*"; }
        { glob = ".Renviron"; }
        { glob = ".xprofile"; }
        { glob = ".xsession"; }
        { glob = ".xsessionrc"; }
        { glob = ".yashrc"; }
        { glob = ".yash_profile"; }
        { glob = ".hushlogin"; }
        { glob = ".xinitrc"; } # ~/.xinitrc
        { glob = "xinitrc"; } # /etc/X11/xinit/xinitrc
        { glob = ".xserverrc"; } # ~/.xserverrc
        { glob = "xserverrc"; } # /etc/X11/xinit/xserverrc
      ];
      shebangs = [ "sh" "bash" "dash" "zsh" ];
      comment-token = "#";
      language-servers = "bash-language-server";
      indent = { tab-width = 2; unit = "  "; };
    }
    {
      name = "make";
      scope = "source.make";
      file-types = [{ glob = "Makefile"; } { glob = "makefile"; } "make" "mk" "mak" {glob = "GNUmakefile"; } { glob = "OCamlMakefile"; }];
      shebangs = ["make" "gmake"];
      injection-regex = "(make|makefile|Makefile|mk)";
      comment-token = "#";
      indent = { tab-width = 4; unit = "\t"; };
    }
    {
      name = "cmake";
      scope = "source.cmake";
      file-types = ["cmake" { glob = "CMakeLists.txt"; }];
      comment-token = "#";
      block-comment-tokens = { start = "#[["; end = "]]"; };
      indent = { tab-width = 2; unit = "  "; };
      language-servers = ["neocmakelsp" "cmake-language-server"];
      injection-regex = "cmake";
    }
    {
      name = "go";
      scope = "source.go";
      injection-regex = "go";
      file-types = ["go"];
      roots = ["go.work" "go.mod"];
      auto-format = true;
      comment-token = "//";
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "gopls" "golangci-lint-lsp" ];
      indent = { tab-width = 4; unit = "\t"; };

      debugger = {
        name = "go";
        transport = "tcp";
        command = "dlv";
        args = [ "dap" ];
        port-arg = "-l 127.0.0.1:{}";

        templates = [
          {
            name = "source";
            request = "launch";
            completion = [ { name = "entrypoint"; completion = "filename"; default = "."; } ];
            args = { mode = "debug"; program = "{0}"; };
          }
          {
            name = "binary";
            request = "launch";
            completion = [ { name = "binary"; completion = "filename"; } ];
            args = { mode = "exec"; program = "{0}"; };
          }
          {
            name = "test";
            request = "launch";
            completion = [ { name = "tests"; completion = "directory"; default = "."; } ];
            args = { mode = "test"; program = "{0}"; };
          }
          {
            name = "attach";
            request = "attach";
            completion = [ "pid" ];
            args = { mode = "local"; processId = "{0}"; };
          
          }
          {
            name = "core";
            request = "launch";
            completion = [ { name = "binary"; completion = "filename"; } { name = "core"; completion = "filename"; } ];
            args = { mode = "core"; program = "{0}"; coreFilePath = "{1}"; };
          }
        ];
      };
    }
    {
      name = "gomod";
      scope = "source.gomod";
      injection-regex = "gomod";
      file-types = [{ glob = "go.mod"; }];
      auto-format = true;
      comment-token = "//";
      language-servers = [ "gopls" ];
      indent = { tab-width = 4; unit = "\t"; };
    }
    {
      name = "gotmpl";
      scope = "source.gotmpl";
      injection-regex = "gotmpl";
      file-types = ["gotmpl"];
      comment-token = "//";
      block-comment-tokens = { start = "/*"; end = "*/"; };
      language-servers = [ "gopls" ];
      indent = { tab-width = 2; unit = " "; };
    }
    {
      name = "gowork";
      scope = "source.gowork";
      injection-regex = "gowork";
      file-types = [{ glob = "go.work"; }];
      auto-format = true;
      comment-token = "//";
      language-servers = [ "gopls" ];
      indent = { tab-width = 4; unit = "\t"; };
    }
    {
      name = "go-format-string";
      scope = "source.go-format-string";
      file-types = [];
      injection-regex = "go-format-string";
    }
    {
      name = "sql";
      scope = "source.sql";
      file-types = ["sql" "dsql"];
      comment-token = "--";
      block-comment-tokens = { start = "/*"; end = "*/"; };
      indent = { tab-width = 4; unit = "    "; };
      injection-regex = "sql";
    }
  ];
}
