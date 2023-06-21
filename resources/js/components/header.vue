<template>
	<div
		class="border-b flex justify-between shadow-sm"
		style="height: 3rem"
	>
		<div class="flex items-center justify-between  w-full p-button-sm">
			<div class="flex space-x-2 h-full">
				<div
					@click="toggleSideBar"
					class="h-full px-5 hover:bg-gray-100 flex items-center cursor-pointer"
				>
					<el-icon style="font-size: 1.2rem">
						<Fold />
					</el-icon>
				</div>

			</div>
			<div class="py-1">
				<!-- <InputText placeholder="Search Menu" type="text" class="min-w-[300px]" /> -->
			</div>
			<div>
				<div
					class="px-4 flex justify-center items-center space-x-4"
					v-if="user"
				>
					<span class="text-gray-600 text-[14px]">{{ user.name }}</span>

					<el-dropdown
						ref="dropdown1"
						trigger="contextmenu"
					>
						<button
							class="p-panel-header-icon p-link mr-2"
							@click="showClick"
						>
							<el-avatar
								:size="30"
								:src="user.img!=null ? user.img.file_path: 'https://th.bing.com/th/id/OIP.PJB4lxw88QRaADN8UWxV4AHaHa?pid=ImgDet&rs=1'"
								class="object-contain"
							>
							</el-avatar>
						</button>
						<template #dropdown>
							<el-dropdown-menu>
								<el-dropdown-item>
									<el-icon>
										<Avatar />
									</el-icon> Profile
								</el-dropdown-item>

								<el-dropdown-item disabled>
									<el-icon>
										<EditPen />
									</el-icon> Change Password
								</el-dropdown-item>
								<el-dropdown-item
									divided
									@click="logout"
								>
									<el-icon>
										<SwitchButton />
									</el-icon> Logout
								</el-dropdown-item>
							</el-dropdown-menu>
						</template>
					</el-dropdown>
				</div>
			</div>
		</div>
		<div></div>
	</div>
</template>

<script>
import { ref } from 'vue'
import { mapGetters } from 'vuex'

export default {
	setup() {
		const dropdown1 = ref()
		function handleVisible2(visible) {
			if (visible) {
				dropdown1.value.handleClose()
			} else {
				dropdown1.value.handleOpen()
			}
		}
		function showClick() {
			dropdown1.value.handleOpen()
		}
		return {
			handleVisible2,
			showClick,
			dropdown1

		}
	},
	components: { mapGetters },
	props: {
		toggleSideBar: Function,
	},
	data() {
		return {
			collapsed: true,
			items: [
				{
					label: 'Options',
					items: [{
						label: 'Update',
						icon: 'pi pi-refresh',
						command: () => {
							this.$toast.add({ severity: 'success', summary: 'Updated', detail: 'Data Updated', life: 3000 });
						}
					},
					{
						label: 'Logout',
						icon: 'pi pi-sign-out',
						command: () => {
							this.logout()
						}
					}
					]
				},
			],
			dropdown1: "",
		}
	},
	computed: {
		...mapGetters({
			user: 'auth/user',
		})
	},
	methods: {
		toggle(event) {
			this.$refs.menu.toggle(event);
		},
		logout() {
			this.$store.dispatch('auth/LOGOUT_SYSTEM').then(respnse => {
				if (respnse) {
					this.$router.push('/login');
				}
			})
		}
	}
};
</script>

<style scoped>
.example-showcase .el-dropdown-link {
	cursor: pointer;
	color: var(--el-color-primary);
	display: flex;
	align-items: center;
}
</style>