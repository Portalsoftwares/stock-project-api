<template>
	<div class="bg-white p-2">
		<div class="self-start">
			<el-input
				placeholder="ស្វែងរក"
				class="sanfont-khmer"
				v-model="search"
			>
				<i class="el-input__icon el-icon-search"></i>
				<CirclePlusFilled class="el-input__icon" />
			</el-input>
		</div>
		<div class="self-end">
			<div class="flex space-x-2">
				<el-button
					type="primary"
					@click="AddUser"
				>
					<el-icon>
						<CirclePlusFilled />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> បន្ថែម ថ្នាក់</span>
				</el-button>
			</div>
		</div>
	</div>

	<div class="grid grid-cols-1 gap-2 ">
		<div class=" border rounded bg-gray-50">
			<div class="flex flex-col  ">
				<div
					class="m-2"
					v-if="showSuccess"
				>
					<el-alert
						title="success alert"
						type="success"
						show-icon
					/>
				</div>
				<div
					class="m-2"
					v-if="showInfo"
				>
					<el-alert
						title="info alert"
						type="info"
						show-icon
					/>
				</div>
				<div>
					<el-table
						v-loading="loading_class"
						:data="tableData"
						height="800"
						style="width: 100%"
						resizable="true"
						fit
						header-cell-class-name="sanfont-khmer text-md"
						row-class-name="sanfont-khmer"
						selectable
					>
						<el-table-column
							type="selection"
							width="55"
						/>
						<el-table-column label="ឈ្មោះ">
							<template #default="scope">{{ scope.row.class_name }}</template>
						</el-table-column>
						<el-table-column label="គ្រូ សរុប">
							<template #default="scope">{{ scope.row.get_teacher_in_class.length }} នាក់
								<el-popover
									placement="right-end"
									:width="400"
									trigger="click"
								>
									<template #reference>
										<el-button style="margin-right: 16px">បង្ហាញគ្រូទាំងអស់</el-button>
									</template>
									<el-table
										:data="scope.row.get_teacher_in_class"
										header-cell-class-name="sanfont-khmer text-xs "
										row-class-name="sanfont-khmer text-xs"
										height="300"
									>
										<el-table-column
											type="index"
											label="ល.រ"
											width="50"
										/>
										<el-table-column
											width="150"
											property="date"
											label="ឈ្មោះគ្រូ"
										>
											<template #default="scope">
												{{   scope.row.teacher_in_class.first_name_kh + ' ' +  scope.row.teacher_in_class.last_name_kh}}
											</template>
										</el-table-column>
										<el-table-column
											width="100"
											property="date"
											label="មុខវិជាបង្រៀន"
										>
											<template #default="scope">
												{{   scope.row.teacher_subject_in_class.name_kh}}
											</template>
										</el-table-column>
										<el-table-column
											property="profile"
											label="រូបភាព"
											width="80"
										>
											<template #default="scope">
												<!-- <img
													:src="(scope.row.teacher_in_class.profile).replace('public/','')"
													class="h-[25px] w-[25px] rounded-full"
												> -->
											</template>
										</el-table-column>
										<el-table-column
											property="profile"
											label="គ្រូបន្ទុក"
											width="80"
										>
											<template #default="scope">
												<div v-if="scope.row.role==1">
													<el-icon
														size="18"
														color="#409EFC"
													>
														<StarFilled />
													</el-icon>
												</div>
											</template>
										</el-table-column>
									</el-table>
								</el-popover>
							</template>
						</el-table-column>
						<el-table-column label="សិស្ស សរុប">
							<template #default="scope">{{ scope.row.count_student_in_class.length }} នាក់
								<el-popover
									placement="right-end"
									:width="400"
									trigger="click"
								>
									<template #reference>
										<el-button style="margin-right: 16px">បង្ហាញសិស្សទាំងអស់</el-button>
									</template>
									<el-table
										:data="scope.row.count_student_in_class"
										header-cell-class-name="sanfont-khmer text-xs "
										row-class-name="sanfont-khmer text-xs"
										height="300"
									>
										<el-table-column
											type="index"
											label="ល.រ"
											width="50"
										/>
										<el-table-column
											width="150"
											property="date"
											label="ឈ្មោះសិស្ស"
										>
											<template #default="scope">
												{{   scope.row.student_in_class.first_name_kh + ' ' +  scope.row.student_in_class.last_name_kh}}
											</template>
										</el-table-column>
										<el-table-column
											property="profile"
											label="រូបភាព"
											width="80"
										>
											<template #default="scope">
												<!-- <img
													:src="(scope.row.student_in_class.profile).replace('public/','')"
													class="h-[25px] w-[25px] rounded-full"
												> -->
											</template>
										</el-table-column>
										<el-table-column
											property="profile"
											label="ប្រធានថ្នាក់"
											width="80"
										>
											<template #default="scope">
												<div v-if="scope.row.role==1">
													<el-icon
														size="18"
														color="#409EFC"
													>
														<StarFilled />
													</el-icon>
												</div>
											</template>
										</el-table-column>
									</el-table>
								</el-popover>
							</template>

						</el-table-column>
						<el-table-column label="ប្រភេទថ្នាក់">
							<template #default="scope">{{ scope.row.class_type.name }}</template>
						</el-table-column>
						<el-table-column label="ឆ្នាំសិក្សា ">
							<template #default="scope">{{ scope.row.academic.academic_name }}</template>
						</el-table-column>
						<el-table-column
							fixed="right"
							label="សកម្មភាព"
						>
							<template #default="scope">
								<router-link
									:to="'/class-detail?id='+scope.row.grade_level_id"
									class="mx-2"
								>
									<el-button
										size="small"
										type="primary"
										class="sanfont-khmer "
									>ចូលមើល</el-button>
								</router-link>
								<el-button
									size="small"
									class="sanfont-khmer"
									@click="editUser(scope.row.id)"
								>កែប្រែ</el-button>
								<el-button
									size="small"
									type="danger"
									class="sanfont-khmer"
									@click="handleDelete(scope.$index, scope.row)"
								>លុប</el-button>
							</template>
						</el-table-column>
						<el-empty description="description"></el-empty>
					</el-table>
				</div>
				<div class="py-2">
					<el-pagination
						background
						layout="prev, pager, next"
						:total="1000"
					>
					</el-pagination>
				</div>
			</div>
		</div>
	</div>
	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៍មានអ្នកប្រើប្រាស់"
		class="sanfont-khmer"
		width="50%"
	>
		<el-form
			class="grid grid-cols-2"
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>
			<div>
				<el-form-item
					label="ឈ្មោះ"
					prop="name"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.name"
						name="name"
						clearable
					></el-input>
				</el-form-item>
				<el-form-item
					label="សារអេឡិចត្រូនិច"
					prop="email"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.email"
						autocomplete="off"
						name="email"
						clearable
					/>
				</el-form-item>
				<el-form-item
					v-if="isShowPassword"
					label="ពាក្យសម្ងាត់"
					prop="password"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.password"
						name="password"
						show-password
					/>
				</el-form-item>
				<el-form-item
					label="តួនាទី"
					prop="roles"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleForm.roles"
						placeholder="Select roles"
						class="text-left "
						multiple
					>
						<el-option
							v-for="data in roles"
							:key="data"
							:label="data.name"
							:value="data.name"
						/>
					</el-select>
				</el-form-item>
			</div>
			<el-form-item
				label="រូបភាព"
				class="sanfont-khmer"
				:label-width="formLabelWidth"
			>
				<div>
					<el-upload
						class="avatar-uploader"
						action="#"
						name="file"
						:show-file-list="true"
						:auto-upload="false"
						:on-change="handleAvatarSuccess"
						:before-upload="beforeAvatarUpload"
					>
						<img
							v-if="imageUrl"
							:src="imageUrl"
							class="avatar 	object-contain "
						>
						<i
							v-else
							class="el-icon-plus avatar-uploader-icon"
						></i>
					</el-upload>
					<input
						type="hidden"
						name="photo_id"
						v-model="ruleForm.photo_id"
					>
				</div>
			</el-form-item>
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
				> បោះបង់</el-button>
				<el-button
					v-if="!isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="submitForm('ruleForm')"
				>
					រក្សាទុក
				</el-button>
				<el-button
					v-if="isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="updateData('ruleForm')"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog user  -->
</template>
<script>
export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			loading_class: false,
			tableData: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			roles: [],
			name: "",
			formLabelWidth: "150px",
			dialogImageUrl: "",
			dialogVisible: false,
			files: {},
			form: {},
			imageUrl: '',
			isShowPassword: true,
			isShowButtonUpdate: false,
			showDataAs: "Table",
			ruleForm: {
				name: null,
				roles: null,
				password: null,
				email: null,
				photo_id: null,
				userId: null
			},
			rules: {
				name: [
					{ required: true, message: 'Please input Activity name', trigger: 'blur' },
					{ min: 3, max: 15, message: 'Length should be 3 to 15', trigger: 'blur' }
				],
				roles: [
					{ required: true, message: 'Please select role', trigger: 'change' }
				],
				email: [
					{ required: true, message: 'Please input email address', trigger: 'blur' },
					{ type: 'email', message: 'Please input correct email address', trigger: ['blur', 'change'] }
				],
				password: [
					{ required: true, message: 'Please set password', trigger: 'blur' },
					{ min: 8, max: 15, message: 'Length should be 3 to 15', trigger: 'blur' }
				],
				photo_id: [
					{ required: true, message: 'Please add photo', trigger: 'change' }
				],
			},
			search: ''
		}
	},
	mounted() {
		this.getData()
	},
	methods: {
		handleAvatarSuccess(file) {
			if (file) {
				this.ruleForm.profile_img = file
				this.imageUrl = URL.createObjectURL(file.raw);
				this.submitUplaod()
			}
		},
		beforeAvatarUpload(file) {
			const isJPG = file.type === 'image/jpeg' || file.type === 'image/png';
			const isLt2M = file.size / 1024 / 1024 < 2;
			if (!isJPG) {
				this.$message.error('Avatar picture must be JPG format!');
			}
			if (!isLt2M) {
				this.$message.error('Avatar picture size can not exceed 2MB!');
			}
			return isJPG && isLt2M;
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
		async submitUplaod() {
			const form = new FormData(document.getElementById('fm'));

			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/files/create/upload', form, config).then(response => {
				this.ruleForm.photo_id = response.data.file.id
				this.$message({
					message: 'Congrats, this is a success message.',
					type: 'success'
				});
			})
		},
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
					message: 'Congrats, this is a success message.',
					type: 'success'
				});
			})
		},
		/*
	*  Function update new user  
	*/
		async updateData() {

			const form = new FormData(document.getElementById('fm'));
			form.append('role', this.ruleForm.roles)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/user/' + this.ruleForm.userId + '/update', form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'Congrats, this is a success message.',
					type: 'success'
				});
			})
		},
		handlePictureCardPreview(UploadFile) {
			this.dialogImageUrl = UploadFile.url
			this.dialogVisible = true
		},
		handleRemove(UploadFile) {
			console.log(UploadFile)
		},

		async AddUser() {
			// this.cancelAction()
			// this.resetForm('ruleForm');
			this.ruleForm.name = ''
			this.ruleForm.userId = ''
			this.ruleForm.roles = ''
			this.ruleForm.email = ''
			this.imageUrl = ''
			this.ruleForm.photo_id = ''
			this.roles = null

			this.dialogFormVisible = true
			this.isShowButtonUpdate = false;
			this.isShowPassword = true;

			await axios.get('/user/create').then(response => {
				this.roles = response.data.roles
			}).catch((error) => {
				console.log(error)
			})
		},
		async getData() {
			this.loading_class = true;
			await axios.get('/grade_level/get').then(response => {
				this.tableData = response.data.data
				this.loading_class = false;
			}).catch((error) => {
				this.loading_class = false;
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async editUser(id) {
			this.isShowButtonUpdate = true;
			this.isShowPassword = false;
			await axios.get('/user/' + id + '/edit').then(response => {
				this.ruleForm.name = response.data.user.name
				this.ruleForm.userId = response.data.user.id
				this.ruleForm.roles = response.data.user_has_roles
				this.ruleForm.email = response.data.user.email
				this.imageUrl = response.data.user.img?.file_path
				this.ruleForm.photo_id = response.data.user.id
				this.roles = response.data.roles
				this.dialogFormVisible = true;
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		notification() {
			this.showSuccess = !this.showSuccess
			ElNotification.success({
				title: 'Success',
				message: 'This is a success message',
				offset: 100,
			})
			ElMessage({
				message: 'Congrats, this is a success message.',
				type: 'success',
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