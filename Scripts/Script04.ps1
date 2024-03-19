
$colors = @("Red","Darkblue","Darkyellow","Cyan","Magenta")

$color = $colors | Get-Random -Count 1

Switch -CaseSensitive ($color) {

    "Red" {
        "Der Wert ist Rot."
        break
    }

    "Darkblue" {
        "Der Wert ist Dunkelblau."
        break
    }

    "Red"
     {
        "Der Wert ist noch immer Rot."
        break
    }

    { $_ -in @("Darkyellow","Cyan","Magenta") } {
        "Der Wert ist entweder Orange, Cyan oder Magenta"
    }

    default {
    
        "Diese Farbe wird noch nicht behandelt. - $color"
    }

}
