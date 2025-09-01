$conType = "tunnel"
$node = "AE1DEVOPSAGT2"
$user = "pd57215"
$params = @(
	"--port"
	"50022"
	"--resource-port" 
	"22"
)

if ($args[1] -ne $null) {
	if ($args[1] -eq 1) {
		$node = "AE1DEVOPSAGT1"
	}
	if ($args[1] -eq 2) {
		$node = "AE1DEVOPSAGT2"
	}
	else {

	}
} 

 if ($args[0] -ne $null) {
	$conType = $args[0]

	switch ($args[0]) {
		"ssh" {
			$params = @(
				"--auth-type"
				"password"
				"--username" 
				"$user"
			)
		}
		"rdp" {
			$params = @(
				"--auth-type"
				"password"
				"--configure"
			)
		}
	}
}

az network bastion $conType --name "AE1-EXT-PRD-BAS" --resource-group "OneForce-PRD-RGR" --target-resource-id "/subscriptions/18a8e7b9-da8a-445f-aac5-d1e4bf3bddca/resourceGroups/oneforce-prd-rgr/providers/Microsoft.Compute/virtualMachines/$node" @params
