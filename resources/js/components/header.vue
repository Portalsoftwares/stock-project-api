<template>
	<div
		class="border-b flex justify-between shadow-sm bg-white"
		style="height: 3rem"
	>
		<div class="flex items-center justify-between  w-full p-button-sm">
			<div class="flex space-x-1 h-full">
				<div
					@click="toggleSideBar"
					class="h-full px-5 hover:bg-gray-100 flex items-center cursor-pointer"
				>
					<el-icon style="font-size: 1.2rem">
						<Fold />
					</el-icon>
				</div>
				<div class="pt-[13px]">
					<span class="text-[16px]"> {{ menu?.name }}</span>
				</div>

			</div>

			<div class="flex space-x-6">

				<div class="self-center">
					<Button @click="toggleFullScreen()">
						<el-icon>
							<FullScreen />
						</el-icon>
					</Button>

				</div>
				<div class="self-center">
					<el-input
						placeholder="ស្វែងរក ផ្ទាំងម៉ីនុយ"
						class="sanfont-khmer"
						v-model="menuSearch"
						:prefix-icon="Search"
					>
					</el-input>
				</div>
				<div
					class="px-4 flex justify-center items-center space-x-4"
					v-if="user"
				>
					<span class="text-gray-600 text-[14px] "> សួស្ដី, <span class="font-semibold">{{ user.name }}</span></span>

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
								<el-dropdown-item @click="dialogFormVisible=true">
									<el-icon>
										<Avatar />
									</el-icon> ប្រវត្តិរូប
								</el-dropdown-item>

								<el-dropdown-item disabled>
									<el-icon>
										<EditPen />
									</el-icon> ប្ដូរលេខសម្ងាត់
								</el-dropdown-item>
								<el-dropdown-item
									divided
									@click="logout"
								>
									<el-icon>
										<SwitchButton />
									</el-icon> ចាកចេញពីគណនី
								</el-dropdown-item>
							</el-dropdown-menu>
						</template>
					</el-dropdown>
				</div>
			</div>
		</div>
		<div></div>
	</div>
	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ប្រវត្តិរូប"
		class="sanfont-khmer"
		width="28%"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ប្រវត្តិរូប</h4>
			</div>
		</template>
		<el-form
			class="grid border rounded"
			id="fm"
		>
			<div class="flex flex-col items-center py-5 ">
				<div class="flex justify-center">
					<img
						src="/storage/uploads/1691209976_student8.jpg"
						class="w-[150px] rounded-full border"
					/>
					<el-button circle>
						<el-icon>
							<Camera />
						</el-icon>

					</el-button>

				</div>
				<div>

					<div
						prop="name"
						class="sanfont-khmer flex justify-center"
					>
						<div class="flex flex-col justify-center">
							<h1 class="font-bold text-[20px] mt-5">វ៉ាន់ សុីវមុី</h1>
							<!-- <h1>@sievmey</h1> -->
						</div>
					</div>

					<div class="pt-[20px] flex justify-center space-x-2">
						<el-form-item class="sanfont-khmer">
							<el-button
								size="medium"
								round
							>
								<el-icon>
									<EditPen />
								</el-icon>
								<span>កែប្រែ</span>
							</el-button>
						</el-form-item>
						<el-form-item class="sanfont-khmer">
							<el-button
								size="medium"
								round
							>
								<el-icon>
									<EditPen />
								</el-icon>
								<span>ប្ដូរលេខសម្ងាត់</span>
							</el-button>
						</el-form-item>
					</div>

					<el-form-item
						label="លេខទូរស័ព្ទ"
						prop="phone"
						class="sanfont-khmer"
						:label-width="formLabelWidth"
					>
						<span>011 999222</span>
					</el-form-item>
					<el-form-item
						label="សារអេឡិចត្រូនិច"
						prop="email"
						class="sanfont-khmer"
						:label-width="formLabelWidth"
					>
						<span>sievmey@gmail.com</span>
					</el-form-item>

					<el-form-item
						label="តួនាទី"
						class="sanfont-khmer"
						:label-width="formLabelWidth"
					>
						<div class="flex space-x-2">

							<el-tag type="info">super-admin</el-tag>
							<el-tag type="info">role-editor</el-tag>
						</div>
					</el-form-item>
				</div>
			</div>
		</el-form>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="cancelAction()"
					class="sanfont-khmer"
					type="danger"
				> បោះបង់</el-button>

			</span>
		</template>

	</el-dialog>
	<!-- Dialog user  -->
</template>

<script>
import { ref } from 'vue'
import { mapGetters } from 'vuex'
import { Search } from '@element-plus/icons-vue'

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
			dropdown1,

		}
	},
	components: { mapGetters, Search },
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
			menuSearch: "",
			dialogFormVisible: false
		}
	},
	computed: {
		...mapGetters({
			user: 'auth/user',
			menu: 'menu/activeMenu',
		})
	},
	methods: {


		getMenuURL() {

			console.log(this.$route.path);
		},
		toggle(event) {
			this.$refs.menu.toggle(event);
		},
		logout() {
			this.$store.dispatch('auth/LOGOUT_SYSTEM').then(respnse => {
				if (respnse) {
					this.$router.push('/login');
				}
			})
		},
		cancelFullScreen() {
			var el = document;
			var requestMethod = el.cancelFullScreen || el.webkitCancelFullScreen || el.mozCancelFullScreen || el.exitFullscreen || el.webkitExitFullscreen;
			if (requestMethod) { // cancel full screen.
				requestMethod.call(el);
			} else if (typeof window.ActiveXObject !== "undefined") { // Older IE.
				var wscript = new ActiveXObject("WScript.Shell");
				if (wscript !== null) {
					wscript.SendKeys("{F11}");
				}
			}
		},

		requestFullScreen(el) {
			// Supports most browsers and their versions.
			var requestMethod = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el.msRequestFullscreen;

			if (requestMethod) { // Native full screen.
				requestMethod.call(el);
			} else if (typeof window.ActiveXObject !== "undefined") { // Older IE.
				var wscript = new ActiveXObject("WScript.Shell");
				if (wscript !== null) {
					wscript.SendKeys("{F11}");
				}
			}
			return false
		},
		toggleFullScreen(el) {
			if (!el) {
				el = document.body; // Make the body go full screen.
			}
			var isInFullScreen = (document.fullScreenElement && document.fullScreenElement !== null) || (document.mozFullScreen || document.webkitIsFullScreen);

			if (isInFullScreen) {
				this.cancelFullScreen();
			} else {
				this.requestFullScreen(el);
			}
			return false;
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