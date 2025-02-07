terraform { 
  cloud { 
    
    organization = "SilverFoxEat" 

    workspaces { 
      name = "Fox-Hipaa-Project" 
    } 
  } 
}