any__loaded_terraform_mk := true

ifndef any__loaded_common_mk
#$(error re.terraform.mk is dependent on re.common.mk; ensure it is loaded after re.common.mk)
endif

define tf-init =
	cd /home/ubuntu/cm/ui/terraform && \
		$(TERRAFORM) init -input=false
endef

define tf-destroy =
	cd /home/ubuntu/cm/ui/terraform && \
		$(TERRAFORM) destroy -force
endef

tf-destroy:
	$(tf-init)
	$(tf-destroy)

.PHONY += tf-destroy

