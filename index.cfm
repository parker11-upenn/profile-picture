<cfsetting showdebugoutput="no">
<cfparam name="request.dsn" default="IncidentMaster">

<cfquery name="QPerson" datasource="#request.dsn#">
    SELECT PersonID, FName, LName, ImageData
    FROM dbo.Persons
    WHERE PersonID IN (7221)
    
</cfquery>

<cfset hasImage = false>
<cfif QPerson.recordCount EQ 1>
    <cfset fullName = encodeForHtml(QPerson.FName & " " & QPerson.LName)>
    <cfset personID = QPerson.PersonID>
    
    <cfif len(trim(QPerson.ImageData))>
        <cfset cleanImage = reReplace(QPerson.ImageData, "\s+", "", "all")>
        <cfset hasImage = true>
    </cfif>
</cfif>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile Pic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        .banner { background-color: #f8f9fa; border-bottom: 1px solid #dee2e6; }
        /* Style for the small dropdown trigger image */
        .profile-thumb {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 50%;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>


<div class="container-fluid">
    <cfoutput>
        <div class="banner d-flex justify-content-between align-items-center p-3">
            <div class="col-md-6">
                <img class="me-3" src="assets/logo_0.svg"> 
            </div>

            <div class="dropdown">
                <a href="##" class="d-flex align-items-center text-dark text-decoration-none" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    
                    <cfif QPerson.recordCount EQ 1 AND hasImage>
                        <img src="data:image/jpeg;base64,#cleanImage#" alt="#fullName#" class="profile-thumb me-2">
                    <cfelse>
                        <i class="fa-solid fa-circle-user fa-2x text-secondary me-2"></i>
                    </cfif>
                    
                </a>

                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                    <li>
                        <a class="dropdown-item" href="##" data-bs-toggle="modal" data-bs-target="##identityCardModal">
                            <i class="fa-solid fa-user me-2"></i>
                            Profile (<cfif QPerson.recordCount EQ 1>#fullName#<cfelse>Unknown</cfif>)
                        </a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="##"><i class="fa-solid fa-gear me-2"></i>Settings</a></li>
                    <li><a class="dropdown-item" href="/chasdatahub/logout.cfm"><i class="fa-solid fa-right-from-bracket me-2"></i>Logout</a></li>
                </ul>
            </div>
        </div>
    </cfoutput>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>