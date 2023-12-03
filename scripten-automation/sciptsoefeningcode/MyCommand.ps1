param(
    [string]$source,
    [string]$Dest,
    [ValidateSet("md5","sha256","bcrypt",ErrorMessage="Cannot validate argument on parameter. is geen geldig hash type")]
    $HashType = "md5",
    $verify
    
)




