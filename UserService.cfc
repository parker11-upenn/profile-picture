<cfcomponent>
    <cffunction name="getUserProfile" access="public" returntype="any">
        <cfargument name="personID" type="any" required="true">
        <cfargument name="type" type="string" required="true">

        <cfset var result = { 
            "fullName" = "Unknown User", 
            "hasImage" = false, 
            "imageData" = "", 
            "recordCount" = 0 
        }>

        <cfquery name="local.q" datasource="IncidentMaster">
            SELECT PersonID, FName, LName, ImageData
            FROM dbo.Persons
            WHERE PersonID = <cfqueryparam value="#arguments.personID#">
        </cfquery>


        <cfif local.q.recordCount EQ 1>
            <cfset result.recordCount = 1>
            <cfset result.fullName = local.q.FName & " " & local.q.LName>
            
            <cfif len(trim(local.q.ImageData))>
                <cfset result.imageData = reReplace(local.q.ImageData, "\s+", "", "all")>
                <cfset result.hasImage = true>
            </cfif>
        </cfif>

        <cfreturn result>
    </cffunction>
</cfcomponent>