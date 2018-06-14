any__loaded_kubernetes_mk := true

ifndef any__loaded_common_mk
#$(error re.kubernetes.mk is dependent on re.common.mk; ensure it is loaded after re.common.mk)
endif

define tf-init =
        cd /home/ubuntu/cm/ui/terraform && \
                terraform init -input=false

endef

define tf-apply =
        cd /home/ubuntu/cm/ui/terraform && \
        terraform apply -input=false -auto-approve

endef

define tf-destroy =
	cd /home/ubuntu/cm/ui/terraform && \
	terraform destroy -force
endef

tf-destroy:
	$(tf-init)
	$(tf-apply)
	$(tf-destroy)
