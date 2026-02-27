<cfset userService = createObject("component", "UserService")>

<cfset user = userService.getUserProfile(personID=72211, type="single")>


<!DOCTYPE html>
<html>
<head>
    <title>Profile Pic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
   <link href="style.css" rel="stylesheet">
        
</head>
<body>

<cfoutput>
<div class="banner d-flex justify-content-between align-items-center p-3 bg-light border-bottom">
    <img src="assets/logo_0.svg" alt="Logo"> 

    <div class="dropdown">
        <a href="##" class="d-flex align-items-center text-dark text-decoration-none" id="profileDropdown" data-bs-toggle="dropdown">
            
            <cfif user.hasImage>
                <img src="data:image/jpeg;base64,#user.imageData#" alt="#user.fullName#" class="profile-thumb me-2">
            <cfelse>
                <i class="fa-solid fa-circle-user fa-2x text-secondary me-2"></i>
            </cfif> 
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
            <li>
                <a class="dropdown-item" href="##">
                    <i class="fa-solid fa-user me-2"></i> Profile (#user.fullName#)
                </a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/logout.cfm"><i class="fa-solid fa-right-from-bracket me-2"></i>Logout</a></li>
        </ul>
    </div>
</div>
</cfoutput>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>