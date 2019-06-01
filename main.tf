provider "scaleway" {
  region = "${var.region}"
  organization = "${var.organization}"
  token        = "${var.scw_token}"
}

data "scaleway_image" "remydahbarinstance" {
  architecture = "x86_64"
  name         = "Ubuntu Bionic"
}

resource "scaleway_server" "remydahbarinstance" {
  name  = "remydahbarinstance"
  image = "${data.scaleway_image.remydahbarinstance.id}"
  type  = "START1-S"
}
resource "scaleway_ip" "ip" {
  server = "${scaleway_server.remydahbarinstance.id}"
}


resource "scaleway_volume" "remydahbarinstance" {
  name       = "remydahbarvolume"
  size_in_gb = 50
  type       = "l_ssd"
}
