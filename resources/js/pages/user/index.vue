<template>
	<div class="bg-white p-2 w-full flex justify-between">
		<div class="self-start">
			<!-- <el-button type="primary">Add </el-button> -->
		</div>
		<div class="self-end">
			<el-button
				type="primary"
				@click="getRole"
			>
				<el-icon>
					<CirclePlusFilled />
				</el-icon>
				<span class="mx-1 sanfont-khmer"> បន្ថែម អ្នកប្រើប្រាស់</span>
			</el-button>
		</div>
	</div>
	<div class="grid grid-cols-1 gap-2 ">
		<div class=" border rounded bg-gray-50">
			<!-- <img
				src="../../../../storage/app/public/uploads/1680759420_uxui.jpg"
				alt=""
			> -->
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
				<!-- <el-alert
					title="warning alert"
					type="warning"
					show-icon
				/>
				<el-alert
					title="error alert"
					type="error"
					show-icon
				/> -->
				<el-table
					:data="tableData"
					height="840"
					style="width: 100%"
					resizable="true"
					selectable
				>
					<el-table-column
						type="selection"
						width="55"
					/>
					<el-table-column
						class="sanfont-khmer"
						label="ឈ្មោះ"
					>
						<template #default="scope">{{ scope.row.name }}</template>
					</el-table-column>
					<el-table-column
						property="email"
						label="Email"
						width="300"
					/>
					<el-table-column
						property="roles"
						label="Role"
						width="400"
					>
						<template #default="scope">
							<div class="flex space-x-1 min-w-[200px]">
								<div
									v-for="data in scope.row.roles "
									:key="data.id"
								>
									<el-tag
										v-if="data.name == 'super-admin'"
										type="success"
										disable-transitions
									>{{ data.name }}</el-tag>
									<el-tag
										v-if="data.name == 'role-editor'"
										type="primary"
										disable-transitions
									>{{ data.name }}</el-tag>
									<el-tag
										v-if="data.name == 'role-viewer'"
										type="info"
										disable-transitions
									>{{ data.name }}</el-tag>
								</div>
							</div>
						</template>
					</el-table-column>
					<el-table-column
						fixed="right"
						label="Operations"
					>
						<template #default="scope">
							<el-button
								size="small"
								@click="editUser(scope.row.id)"
							>Edit</el-button>
							<el-button
								size="small"
								type="danger"
								@click="handleDelete(scope.$index, scope.row)"
							>Delete</el-button>
						</template>
					</el-table-column>
				</el-table>
			</div>
		</div>
	</div>
	<el-dialog
		v-model="dialogFormVisible"
		title="Profile Information"
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
					label="Name"
					prop="name"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.name"
						name="name"
						clearable
					></el-input>
				</el-form-item>
				<el-form-item
					label="Email"
					prop="email"
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
					label="Password"
					prop="password"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.password"
						name="password"
						show-password
					/>
				</el-form-item>
				<el-form-item
					label="Roles"
					prop="roles"
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
				<el-button @click="cancelAction()">Cancel</el-button>
				<el-button
					v-if="!isShowButtonUpdate"
					type="primary"
					@click="submitForm('ruleForm')"
				>
					Create
				</el-button>
				<el-button
					v-if="isShowButtonUpdate"
					type="primary"
					@click="updateData('ruleForm')"
				>
					Update
				</el-button>
			</span>
		</template>
	</el-dialog>
</template>
<script>
// import { Delete, Edit, Search, Share, Upload } from '@element-plus/icons-vue'
export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			tableData: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			roles: [],
			name: "",
			formLabelWidth: "100px",
			dialogImageUrl: "",
			dialogVisible: false,
			files: {},
			form: {},
			imageUrl: '',
			isShowPassword: true,
			isShowButtonUpdate: false,

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
			}
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
			this.$refs[formName].resetFields();
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

		async getRole() {
			this.cancelAction()
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
			await axios.get('/user/get').then(response => {
				this.tableData = response.data.users
			}).catch((error) => {
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
.el-dialog__header .el-dialog__title {
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