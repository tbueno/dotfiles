{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Thiago Bueno";
    userEmail = "tbueno@gmail.com";
  };
}