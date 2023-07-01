{
  programs.git = {
    enable = true;
    userName = "Guilherme Menezes";
    userEmail = "guilhermeladins@gmail.com";
    signing = {
      key = "BDDEFF5362722B11";
      signByDefault = true;  
    };
    extraConfig = {
      safe = {
        directory = [ "/etc/nixos" ];
      };
    
      branch = {
        autosetuprebase = "always";
      };
      
      github = {
        user = "thechibbis";
      };
    };
  }; 
}
