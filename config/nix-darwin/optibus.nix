{ config, lib, pkgs, home, ... }:

{
  home.packages = with pkgs; [
    saml2aws
  ];

  home.sessionVariables = {
    AWS_REGION = "us-east-2";
    AWS_DEFAULT_REGION = "us-east-2";
    AWS_PROFILE="saml";
    PATH = "/opt/homebrew/opt/openssl@3.3/bin:$PATH";
    CFLAGS = "-I/opt/homebrew/opt/openssl@1.1/include";
    CPPFLAGS = "-I/opt/homebrew/opt/openssl@1.1/include";
    CRYPTOGRAPHY_SUPPRESS_LINK_FLAGS = "1";
    DEV_ROOT = "~/dev";
    LDFLAGS = "/opt/homebrew/opt/openssl@1.1/lib/libssl.a /opt/homebrew/opt/openssl@1.1/lib/libcrypto.a";
  };

  home.shellAliases = {
    aws_login = "saml2aws login --session-duration=28800";
  };
}