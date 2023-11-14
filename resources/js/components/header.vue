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
					<el-autocomplete
						placeholder="ស្វែងរក ផ្ទាំងម៉ីនុយ"
						class="inline-input sanfont-khmer"
						v-model="Search"
						:fetch-suggestions="querySearch"
						@select="handleSelect"
					></el-autocomplete>
				</div>
				<div
					class="px-4 flex justify-center items-center space-x-4"
					v-if="user"
				>
					<span class="text-gray-600 text-[14px] "> សួស្ដី, <span class="font-semibold">{{ user.name}}</span></span>
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
								:src="user.img != null ? user.img.file_path : 'https://th.bing.com/th/id/OIP.PJB4lxw88QRaADN8UWxV4AHaHa?pid=ImgDet&rs=1'"
								class="object-contain"
							>
							</el-avatar>
						</button>
						<template #dropdown>
							<el-dropdown-menu>
								<el-dropdown-item @click="dialogFormVisible = true">
									<el-icon>
										<Avatar />
									</el-icon> ប្រវត្តិរូប
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
		width="40%"
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
			ref="changePW"
			:model="objData"
			:rules="rules"
			label-position="left"
		>
			<div class="flex flex-col items-center py-5 ">
				<div
					class="flex justify-center"
				>
					<img
						:src="user.img !=null?user.img.file_path : 'https://th.bing.com/th/id/OIP.PJB4lxw88QRaADN8UWxV4AHaHa?pid=ImgDet&rs=1'"
						class="avatar object-contain rounded-full"
					>
				</div>

				<div>
					<div
						prop="name"
						class="sanfont-khmer flex justify-center"
					>
						<div class="flex flex-col justify-center">
							<h1 class="font-bold text-[20px] mt-5">{{ user.name }}</h1>
						</div>
					</div>

					<div class="pt-[20px] flex justify-center space-x-2">
						<el-form-item class="sanfont-khmer">
							<el-button
								size="medium"
								round
								@click="changePasswordAction"
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
						<span
							v-if="user.phone"
							class="w-[300px] text-left"
						>
							<el-input
								v-model="user.phone"
								disabled
							></el-input>
						</span>
						<span v-else>N/A</span>
					</el-form-item>
					<el-form-item
						label="សារអេឡិចត្រូនិច"
						prop="email"
						class="sanfont-khmer"
						:label-width="formLabelWidth"
					>
						<span
							v-if="user.email"
							class="w-[300px] text-left"
						>
							<el-input
								v-model="user.email"
								disabled
							></el-input>
						</span>
						<span v-else>N/A</span>
					</el-form-item>

					<el-form-item
						label="តួនាទី"
						class="sanfont-khmer"
						:label-width="formLabelWidth"
					>
						<div
							class="flex space-x-2 w-[300px] text-left"
							v-if="user.roles"
						>
							<el-tag
								v-for="data in user.roles "
								:key="data"
							> {{ data.name }}</el-tag>
						</div>

					</el-form-item>
					<div class="w-full">
						<div v-if="is_changePW">
							<el-form-item
								label="ពាក្យសម្ងាត់ចាស់"
								prop="old_pw"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input v-model="objData.old_pw"></el-input>
							</el-form-item>
							<el-form-item
								label="ពាក្យសម្ងាត់ថ្មី"
								prop="new_pw"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input v-model="objData.new_pw"></el-input>
							</el-form-item>
						</div>
					</div>
				</div>
			</div>
		</el-form>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					v-if="is_changePW"
					type="primary"
					@click="submitForm('changePW')"
					:loading="loading"
				>រក្សាទុក</el-button>
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
			imageUrl: '',
			collapsed: true,
			formLabelWidth: '200px',
			objData: {
				old_pw: '',
				new_pw: '',
				id: '',

			},
			rules: {
				old_pw: [
					{ required: true, message: 'សូមបញ្ចូល ពាក្យសម្ងាត់ចាស់', trigger: 'blur' }
				],
				new_pw: [
					{ required: true, message: 'សូមបញ្ចូល​ ពាក្យសម្ងាត់ថ្មី', trigger: 'blur' }
				],

			},
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
			menuSearch: [],
			Search: [],
			dialogFormVisible: false,
			is_changePW: false
		}
	},
	mounted() {
		this.menuSearch = this.loadAll();
	},
	computed: {
		...mapGetters({
			user: 'auth/user',
			menu: 'menu/activeMenu',
		})
	},
	methods: {
		querySearch(queryString, cb) {
			var links = this.menuSearch;
			var results = queryString ? links.filter(this.createFilter(queryString)) : links;
			// call callback function to return suggestions
			cb(results);
		},
		createFilter(queryString) {
			return (link) => {
				return (link.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
			};
		},
		loadAll() {
			return [
				{ "value": "ដាសបត", "link": "Dashboard" },
				{ "value": "អ្នកប្រើប្រាស់", "link": "User" },
				{ "value": "គ្រូបង្រៀន", "link": "teacher" },
				{ "value": "សិស្សានុសិស្ស", "link": "student" },
				{ "value": "មុខវិជ្ជា", "link": "subject" },
				{ "value": "ថ្នាក់រៀន", "link": "class" },
				{ "value": "ការប្រឡង", "link": "score-type" },
				{ "value": "ម៉ោងសិក្សា", "link": "time" },
				{ "value": "ឆ្នាំសិក្សា", "link": "academic" },
				{ "value": "របាយការណ៍", "link": "reports" },
				{ "value": "ការកំណត់", "link": "setting" },
			];
		},
		handleSelect(item) {
			console.log(item);
			this.$router.push({ name: item.link })
		},

		changePasswordAction() {
			this.is_changePW = !this.is_changePW;
		},
		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.savePWD()
				}
			});
		},
		async savePWD() {

			this.objData.id = this.user.id
			await axios.post('/user/update/' + this.objData.id + '/pw', this.objData).then(response => {
				this.is_changePW = false;
				this.$notify.success({
					title: 'ព័ត៌មាន',
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					showClose: true
				});
			}).catch((error) => {
				if (error.response.status == 403) {
					let errors = error.response.data.message;
					this.$notify.error({
						title: 'កំហុស',
						message: errors,
						showClose: true
					});
				}
			})
		},
		cancelAction() {
			this.dialogFormVisible = false;
			this.is_changePW = false;
		},
		getRoleNames(roles) {
			return roles.map(role => `${role.name}`).join(' ,');
		},
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