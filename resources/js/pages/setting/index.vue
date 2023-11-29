<template>
	<el-tabs
		type="border-card"
		v-model="tabTypeScore"
		@tab-change="changeTap"
	>
		<el-tab-pane
			label="ការកំណត់"
			name="tab-setting-1"
		>
			<div class="grid grid-cols-1 gap-2 ">
				<div class=" border rounded bg-gray-50  p-4">
					<div class="flex flex-col  ">
						<el-form
							ref="ruleForm"
							id="fm"
							label-position="top"
						>

							<div class="grid grid-cols-1 xl:grid-cols-2 gap-8">

								<div class="grid grid-cols-2">
									<div>
										<div class="py-2">
											<div class="font-bold text-left text-lg">
												ព័ត៌មានសាលា
											</div>
										</div>
										<div class="flex flex-col ">

											<div>

												<el-form-item
													label="ឈ្មោះសាលា"
													prop="from_secondary_high_school"
													class="sanfont-khmer "
													:label-width="formLabelWidth"
												>
													<el-input
														v-model="ruleForm.name"
														name="from_secondary_high_school"
														clearable
													></el-input>
												</el-form-item>
											</div>
											<div>

												<el-form-item
													label="លេខទូរស័ព្ទ"
													prop="secondary_exam_date"
													class="sanfont-khmer "
													:label-width="formLabelWidth"
												>
													<el-input
														v-model="ruleForm.phone"
														name="secondary_exam_date"
														clearable
													></el-input>
												</el-form-item>
											</div>
											<div>

												<el-form-item
													label="សារអេឡិចទ្រូនិច"
													prop="secondary_exam_place"
													class="sanfont-khmer "
													:label-width="formLabelWidth"
												>
													<el-input
														v-model="ruleForm.email"
														name="secondary_exam_place"
														clearable
													></el-input>
												</el-form-item>
											</div>
										</div>
									</div>
									<div class="flex flex-col ">
										<div class="py-2">
											<div class="font-bold text-left text-lg h-7">

											</div>
										</div>
										<el-form-item
											label="ទីតាំង"
											prop="secondary_exam_room"
											class="sanfont-khmer "
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.address"
												name="secondary_exam_room"
												type="textarea"
												:rows="4"
											></el-input>
										</el-form-item>

									</div>

								</div>
								<div class="grid grid-cols-1">
									<div class="flex flex-col justify-start">
										<div class="py-2">
											<div class="font-bold text-left text-lg">
												Backup ស្វ័យប្រវត្តិ
											</div>
										</div>
										<div>

											<el-form-item
												label="ពេល BackUp"
												prop="from_secondary_high_school"
												class="sanfont-khmer "
												
												:label-width="formLabelWidth"
											>
												<el-radio-group disabled v-model="ruleForm.backup_type">
													<el-radio-button label="បិទ" />
													<el-radio-button label="ប្រចាំថ្ងៃ" />
													<el-radio-button label="ប្រចាំសប្តាហ៍" />
													<el-radio-button label="ប្រចាំខែ" />
													<el-radio-button label="ប្រចាំឆ្នាំ" />
												</el-radio-group>
											</el-form-item>
										</div>
										<div>

											<el-form-item
												label="ម៉ោង BackUp"
												prop="from_secondary_high_school"
												class="sanfont-khmer "
												:label-width="formLabelWidth"
											>
												<el-time-select
												    disabled
													v-model="ruleForm.backup_time"
													start="00:00"
													step="00:30"
													end="23:59"
												/>
											</el-form-item>
										</div>
									</div>

								</div>
							</div>
							<div class="flex align-end">

								<el-button
									@click="updateInfo"
									type="primary"
								>រក្សាទុក</el-button>
							</div>
						</el-form>
					</div>
				</div>

			</div>

		</el-tab-pane>
		<el-tab-pane
			label="Backup និងស្តាទិន្នន័យ"
			name="tab-setting-2"
		>
			<div class="bg-white p-2 w-full flex justify-between">
				<div class="flex space-x-2">
					<div class="self-start">
						<el-input placeholder="ស្វែងរក" class="sanfont-khmer" v-model="search" @input="clickSearch">
					</el-input>
					</div>
					<div class="self-start hidden ">

					</div>
				</div>
				<div class="self-end">
					<!-- <el-button>
						<el-icon>
							<Document />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> ស្តារទិន្នន័យពីម៉ាសុីន</span>

					</el-button> -->
					<el-button
						type="primary"
						:disabled="permission_create"
						@click="backup"
						
					>
						<el-icon v-if="!loading_backup" >
							<CirclePlusFilled />
						</el-icon>
						<el-icon v-if="loading_backup" :class="loading_backup==true?'animate-spin':''">
										<Tools />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> បង្កើត Backup File</span>
					</el-button>
				</div>
			</div>
			<div class="grid grid-cols-1 gap-2 ">
				<div class=" border rounded bg-gray-50">
					<div class="flex flex-col  ">

						<el-table
							:data="tableData"
							height="750"
							style="width: 100%"
							resizable="true"
							header-cell-class-name="header-table-font-khmer text-md"
							row-class-name="sheader-table-font-khmer"
							selectable
							v-loading="loading"
							stripe
						>
							<el-table-column
								type="selection"
								width="55"
							/>

							<el-table-column
								type="index"
								width="90"
								label="ល.រ"
							>
							</el-table-column>

							<el-table-column label="ឈ្មោះ">
								<template #default="scope">
									<div>{{ scope.row.path }}</div>

								</template>
							</el-table-column>
							<el-table-column label="ប្រភេទ">
								<template #default="scope">
									<div>{{ scope.row.type }}</div>
								</template>
							</el-table-column>
							<el-table-column
								label="ថ្ងៃទទួលបាន"
								sortable
							>
								<template #default="scope">
									<div>{{ scope.row.date }}</div>
								</template>
							</el-table-column>
							<el-table-column label="ទំហំផ្ទុក">
								<template #default="scope">
									<div>{{ scope.row.size }}</div>

								</template>
							</el-table-column>

							<el-table-column
								align="center"
								fixed="right"
								label="សកម្មភាព"
							>
								<template #default="scope">
									<el-popconfirm
										width="220"
										confirm-button-text="យល់ព្រម"
										cancel-button-text="ទេ"
										:icon="InfoFilled"
										icon-color="#626AEF"
										title="តើអ្នកពិតជាចង់ស្ដារទិន្នន័យមែនទេ?"
										cancel-button-type="info"
										@confirm="restore(scope.row.id)"
										:disabled="permission_restore"
									>
										<template #reference>
											<el-button
												size="small"
												class="sanfont-khmer"
											>ស្ដារទិន្នន័យ</el-button>
										</template>
									</el-popconfirm>
									<el-popconfirm
										width="220"
										confirm-button-text="យល់ព្រម"
										cancel-button-text="ទេ"
										:icon="InfoFilled"
										icon-color="#626AEF"
										title="តើអ្នកពិតជាចង់លុបទិន្នន័យមែនទេ?"
										cancel-button-type="info"
										@confirm="handleDelete(scope.row.id)"
									>
										<template #reference>
											<el-button
												size="small"
												type="danger"
												class="sanfont-khmer"
												:disabled="permission_delete"
											>លុប</el-button>
										</template>
									</el-popconfirm>
								</template>
							</el-table-column>

							<el-empty description="description"></el-empty>
						</el-table>

					</div>
				</div>
			</div>

		</el-tab-pane>

		<el-tab-pane
			label="តួនាទីអ្នកប្រើប្រាស់"
			name="tab-setting-3"
		>
			<div>
				<div class="bg-white p-2 w-full flex justify-between">
					<div class="flex space-x-2">
						<div class="self-start">
							<el-input placeholder="ស្វែងរក" class="sanfont-khmer" v-model="search" @input="clickSearch"></el-input>
						</div>
						<div class="self-start hidden ">

						</div>
					</div>
					<div class="self-end">
						<!-- <el-button>
						<el-icon>
							<Document />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> ស្តារទិន្នន័យពីម៉ាសុីន</span>

					</el-button> -->
						<el-button
							type="primary"
							@click="AddRole"
							:disabled="permission_create1"
						>
							<el-icon>
								<CirclePlusFilled />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> បន្ថែម</span>
						</el-button>
					</div>
				</div>
				<el-table
					v-loading="loading"
					:data="roleData.data"
					resizable="false"
					header-cell-class-name="sanfont-khmer text-md"
					row-class-name="sanfont-khmer"
					style="width: 100% ; height: 750px;"
					stripe
				>
					<el-table-column
						label="ល.រ"
						type="index"
					></el-table-column>
					<el-table-column label="ឈ្មោះតួនាទី">
						<template #default="scope">
							<div>
								<span>{{ scope.row.name }}</span>
							</div>
						</template>
					</el-table-column>
					<el-table-column label="កាលបរិច្ចេទបង្កើត">
						<template #default="scope">
							<div>
								<span>{{ scope.row.date }}</span>
							</div>
						</template>
					</el-table-column>
					<el-table-column
						width="220"
						align="center"
						fixed="right"
						label="សកម្មភាព"
					>
						<template #default="scope">
							<div v-if="!loading">
								<el-button
									size="small"
									class="sanfont-khmer"
									@click="editRole(scope.row.id)"
									:disabled="permission_edit1"
								>កែប្រែ</el-button>
								<el-popconfirm
									width="220"
									confirm-button-text="យល់ព្រម"
									cancel-button-text="ទេ"
									:icon="InfoFilled"
									icon-color="#626AEF"
									title="តើអ្នកពិតជាចង់លុបមែនទេ?"
									cancel-button-type="info"
									@confirm="deleteRole(scope.row.id)"
								>
									<template #reference>
										<el-button
											size="small"
											type="danger"
											class="sanfont-khmer"
											:disabled="permission_delete1"
										>លុប
										</el-button>
									</template>
								</el-popconfirm>
							</div>
						</template>
					</el-table-column>

				</el-table>
			</div>
		</el-tab-pane>
	</el-tabs>
	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		class="sanfont-khmer text-white"
		width="70%"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានតួនាទី</h4>
			</div>
		</template>
		<el-form
			class="grid"
			:model="ruleFormRole"
			:rules="rulesRole"
			ref="ruleFormRole"
			id="fm"
		>

			<div class="">
				<el-form-item label="ឈ្មោះតួនាទី" prop="name" >
					<el-input v-model="ruleFormRole.name"  />
				</el-form-item>
				<div class="text-left text-md font-bold py-2">
					សិទ្ធិអ្នកប្រើប្រាស់
				</div>
				<div class="text-left">
				<div class="py-2">
					<el-checkbox
						v-model="checkAll"
						:indeterminate="isIndeterminate"
						@change="handleCheckAllChange"
					>ជ្រើសរើសទាំងអស់</el-checkbox>
				</div>
		
						<div class="grid grid-cols-5 gap-5 ">
							<el-checkbox
								v-for="perms in permissionData"
								:key="perms.id"
								:label="perms.id"
								v-model="perms.checked"
							>
								{{perms.name}}
							</el-checkbox>
						</div>
				
				</div>
			</div>

		</el-form>
		<el-dialog v-model="dialogVisible">
			<img
				w-full
				:src="dialogImageUrl"
				alt="Preview Image"
			/>
		</el-dialog>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="cancelAction()"
					class="sanfont-khmer"
					type="danger"
				> បោះបង់</el-button>
				<el-button
				    v-if="!isShowButtonUpdate"

					type="primary"
					class="sanfont-khmer"
					@click="submitFormRole('ruleFormRole')"
				>
					រក្សាទុក
				</el-button>
				<el-button
					v-if="isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="submitFormUpdateRole('ruleFormRole')"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog user  -->
</template>
<script>
import { fnpermissions } from '../../permissions'

export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			//Check permission
			permission_view: !fnpermissions.can('backup-view'),
			permission_create: !fnpermissions.can('backup-create'),
			permission_restore: !fnpermissions.can('backup-restore'),
			permission_delete: !fnpermissions.can('backup-delete'),
			permission_view1: !fnpermissions.can('role-permission-view'),
			permission_create1: !fnpermissions.can('role-permission-create'),
			permission_edit1: !fnpermissions.can('role-permission-edit'),
			permission_delete1: !fnpermissions.can('role-permission-delete'),


			tableData: [],
			tableDataSubjectLevel: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			roles: [],
			name: "",
			formLabelWidth: "160px",
			dialogImageUrl: "",
			dialogVisible: false,
			files: {},
			form: {},
			imageUrl: '',
			isShowPassword: true,
			isShowButtonUpdate: false,


			ruleForm: {
				name: null,
				phone: null,
				email: null,
				address: null,
				backup_type: null,
				backup_time: null,
			},

			search: '',

			classTypeValue: '',
			tabTypeScore: 'tab-setting-1',

			//role
			roleData: [],
			cities: ['Shanghai', 'Beijing', 'Guangzhou', 'Shenzhen'],
			permissionData:[],
			ruleFormRole:{
				name: null,
				permission: null,
				id: null,
			},
			rulesRole: {
				name: [
					{ required: true, message: 'សូមបញ្ជូលតួនាទី', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
			},
			checkAll: false,
			tSearch: null,
			search: '',
			//Backup
			loading_backup:false
		}
	},
	mounted() {
		this.getData();
		this.tabTypeScore = localStorage.getItem('tab-setting') ?? 'tab-setting-1';
		this.getDataRole();
		this.getSetting();

	},
	methods: {
		changeTap(name) {
			localStorage.setItem('tab-setting', name);
			if (name == 'tab-setting-2') {
				this.getData();
			} else {
				this.getDataRole();
			}
		},
		async updateInfo() {
			const data = {
				'name': this.ruleForm.name,
				'email': this.ruleForm.email,
				'phone': this.ruleForm.phone,
				'address': this.ruleForm.address,
				'backup_type': this.upBackUpType(this.ruleForm.backup_type),
				'backup_time': this.ruleForm.backup_time
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/setting/update', data, config).then(response => {
				this.getSetting();
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async getSetting() {
			await axios.get('/setting/get').then(response => {
				this.ruleForm.name = response.data.data.name
				this.ruleForm.email = response.data.data.email
				this.ruleForm.phone = response.data.data.phone
				this.ruleForm.address = response.data.data.address
				this.ruleForm.backup_type = this.getBackUpType(response.data.data.backup_type)
				this.ruleForm.backup_time = response.data.data.backup_time
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		getBackUpType(t) {
			switch (t) {
				case "1":
					return 'ប្រចាំថ្ងៃ'
				case "2":
					return 'ប្រចាំសប្តាហ៍'
				case "3":
					return 'ប្រចាំខែ'
				case "4":
					return 'ប្រចាំឆ្នាំ'
				default:
					return 'រាល់នាទី'

			}
		},
		upBackUpType(t) {
			switch (t) {
				case "ប្រចាំថ្ងៃ":
					return 1
				case "ប្រចាំសប្តាហ៍":
					return 2
				case "ប្រចាំខែ":
					return 3
				case "ប្រចាំឆ្នាំ":
					return 4
				default:
					return 0
			}
		},
		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.submitData()
					this.resetForm('ruleForm')
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		cancelAction() {
			this.resetForm('ruleForm');
			this.dialogFormVisible = !this.dialogFormVisible;
			this.imageUrl = null

		},
		resetForm(formName) {
			if (this.$refs[formName]) {
				this.$refs[formName].resetFields();
			}
		},
		/*
		*  Function upload image 
		*/

		/*
		*  Function create new user  
		*/
		async submitData() {
			const form = new FormData(document.getElementById('fm'));
			form.append('role', this.ruleForm.roles)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/user/store', form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		/*
	*  Function update new user  
	*/
		async backup() {
			this.loading_backup = true;
			this.loading = true;
			await axios.post('/backup/create').then(response => {
				if (response.status == 200) {
					this.loading_backup = false;
					this.loading = false;
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
						type: 'success'
					});
					this.getData();
				}
			})
		},
		async restore(id) {
			this.loading_backup = true;
			this.loading = true;
			await axios.post('/backup/restore/'+id).then(response => {
				if (response.status == 200) {
					this.loading_backup = false;
					this.loading = false;
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
						type: 'success'
					});
					this.getData();
				}
			})
		},
		async handleDelete(id) {
			this.loading_backup = true;
			this.loading = true;
			await axios.delete('/backup/delete/'+id).then(response => {
				if (response.status == 200) {
					this.loading_backup = false;
					this.loading = false;
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
						type: 'success'
					});
					this.getData();
				}
			})
		},
		async getData() {
			this.loading = true
			await axios.get('/backup/get').then(response => {
				this.tableData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},


		//Role 
		// ស្វែងរក ទិន្នន័យ
		clickSearch() {

			clearTimeout(this.tSearch);
			this.tSearch = setTimeout(() => {
				if (this.search != null) {
					if (this.search.replace(/\s/g, '') !== '') {
					}
					this.getDataRole();
				}
			}, 1000);
		},
		async getDataRole() {
			this.loading = true
			await axios.get('/role/get?search='+this.search).then(response => {
				this.roleData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		async AddRole() {
			await axios.get('/role/get-permission').then(response => {
				this.permissionData = response.data.data
				this.loading = false
				this.dialogFormVisible = true
				this.isShowButtonUpdate = false
				this.ruleFormRole.name = ''
				this.ruleFormRole.id = ''

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		handleCheckAllChange() {
			this.permissionData.forEach(e => {
				e.checked = this.checkAll
			})
		},
		submitFormRole(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.StoreRole()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		submitFormUpdateRole(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.UpdateRole()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		async StoreRole() {
			const data = {
				'role_name': this.ruleFormRole.name,
				'permissions': this.permissionData
			}
			await axios.post('/role/store', data).then(response => {
				this.getDataRole();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async UpdateRole() {
			const data = {
				'role_name': this.ruleFormRole.name,
				'permissions': this.permissionData
			}
			await axios.post('/role/update/'+this.ruleFormRole.id , data).then(response => {
				this.getDataRole();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async editRole(id) {
			await axios.get('/role/edit/' + id).then(response => {
				this.isShowButtonUpdate=true
				this.permissionData = response.data.data
				this.ruleFormRole.name = response.data.role_name.name
				this.ruleFormRole.id = response.data.role_name.id
				this.dialogFormVisible = true;
			})
		},
		async deleteRole(id) {
			await axios.delete('/role/delete/'+id).then(response => {
				this.getDataRole();
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			}).catch((error) => {
				if (error.response.status == 400) {
					this.$message({
						message: error.response.data.data,
						type: 'error'
					});
				}
			})
		}
	}
}
</script>
<style >
.avatar-uploader .el-upload {
	border: 1px dashed #d9d9d9;
	border-radius: 6px;
	cursor: pointer;
	position: relative;
	overflow: hidden;
}
.avatar-uploader .el-upload:hover {
	border-color: #409eff;
}
.avatar-uploader-icon {
	font-size: 28px;
	color: #8c939d;
	width: 140px;
	height: 140px;
	line-height: 178px;
	text-align: center;
}
.avatar {
	width: 140px;
	height: 140px;
	display: block;
}

.el-button--text {
	margin-right: 15px;
}
.el-select {
	width: 300px;
}
.el-input {
	width: 300px;
}
.dialog-footer button:first-child {
	margin-right: 10px;
}
:global(h2#card-usage ~ .example .example-showcase) {
	background-color: var(--el-fill-color) !important;
}

.el-statistic {
	--el-statistic-content-font-size: 28px;
}

.statistic-card {
	height: 100%;
	padding: 20px;
	border-radius: 4px;
	background-color: var(--el-bg-color-overlay);
}

.statistic-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	font-size: 12px;
	color: var(--el-text-color-regular);
	margin-top: 16px;
}

.statistic-footer .footer-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.el-dialog__header {
	text-align: left;
}
.statistic-footer .footer-item span:last-child {
	display: inline-flex;
	align-items: center;
	margin-left: 4px;
}

.green {
	color: var(--el-color-success);
}

.red {
	color: var(--el-color-error);
}
</style>