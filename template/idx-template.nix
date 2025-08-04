/*
rm -rf ~/template-output
idx-template \
    /home/user/gemini-cli-template/template \
    --output-dir /home/user/template-output \
    -a '{"language": "js"}'

*/
{ pkgs, ... }: {
  packages = [
    pkgs.git
  ];
  # Shell script that produces the final environment
  bootstrap = ''
    # Set up git clone and copy to workspace out folder
    git clone https://github.com/google-gemini/gemini-cli/    
    cp -rf ./gemini-cli "$out"

    # Set up dev.nix for the workspace
    mkdir "$out/.idx"
    cp ${./.idx/dev.nix} "$out/.idx/dev.nix"

    # Set some permissions
    chmod -R +w "$out"
  '';
}