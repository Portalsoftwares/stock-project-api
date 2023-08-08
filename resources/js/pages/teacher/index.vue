<template>
	<div class="bg-white p-2 w-full flex justify-between border rounded-t">
		<div class="flex space-x-2">
			<div class="self-start">
				<el-input
					placeholder="ស្វែងរក"
					class="sanfont-khmer"
					v-model="search"
				>
				</el-input>
			</div>
			<div class="self-start  ">
				<el-select
					v-model="filterSelectValue "
					filterable
					clearable
					multiple
					placeholder="ឯកទេស"
				>
					<el-option
						v-for="item in filter"
						:key="item.filterValue"
						:label="item.filterLabel"
						:value="item.filterValue"
					>
					</el-option>
				</el-select>
			</div>
			<div class="self-start  ">
				<el-select
					v-model="teacher_levelSelectValue"
					filterable
					clearable
					placeholder="កំរិត"
				>
					<el-option
						v-for="item in teacher_level"
						:key="item.filterValue"
						:label="item.teacher_level_Label"
						:value="item.teacher_level_value"
					>
					</el-option>
				</el-select>
			</div>
			<el-button type="primary">
				<el-icon>
					<Search />
				</el-icon>
			</el-button>
		</div>

		<div class="self-end">
			<el-button type="info">
				<el-icon>
					<Document />
				</el-icon>
				<span class="mx-1 sanfont-khmer"> ទាញ Excel</span>

			</el-button>
			<el-button
				type="primary"
				@click="AddUser"
			>
				<el-icon>
					<CirclePlusFilled />
				</el-icon>
				<span class="mx-1 sanfont-khmer"> បន្ថែមគ្រូ</span>
			</el-button>
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
				<el-table
					:data="tableData"
					height="770"
					style="width: 100%"
					resizable="true"
					header-cell-class-name="header-table-font-khmer text-md"
					row-class-name="sanfont-khmer"
					selectable
					v-loading="loading"
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
					<el-table-column
						width="100"
						align="start"
						label="រូបភាព"
					>
						<template #default="scope">
							<el-image
								style="width: 40px; height: 40px"
								:src="scope.row.profile_img?.file_path"
								fit="cover"
								:lazy="true"
								class="rounded-full"
							/>
						</template>
					</el-table-column>
					<el-table-column
						width="100"
						align="start"
						label="អត្តលេខ"
						sortable
					>
						<template #default="scope">{{ "PK-T00"+ scope.row.teacher_id}}</template>
					</el-table-column>
					<el-table-column
						width="180"
						label="គោត្តនាម និងនាម"
						sortable
					>
						<template #default="scope">{{scope.row.first_name_kh +" "+scope.row.last_name_kh }}</template>
					</el-table-column>
					<el-table-column
						property="first_name_en"
						label="គោត្តនាម និងនាមឡាតាំង"
						width="250"
						sortable
					>
						<template #default="scope">{{scope.row.first_name_en +" "+scope.row.last_name_en }}</template>

					</el-table-column>
					<el-table-column
						width="120"
						label="តួនាទី"
						sortable
					>
						<template #default="scope">
							<div v-if="scope.row.gender_id == 1">គ្រូ</div>
							<div v-else>គ្រូវិន័យ</div>
						</template>
					</el-table-column>
					<el-table-column
						width="120"
						label="ភេទ"
						sortable
					>
						<template #default="scope">
							<div v-if="scope.row.gender_id == 1">ប្រុស</div>
							<div v-else>ស្រី</div>
						</template>
					</el-table-column>
					<el-table-column
						label="ថ្ងៃ ខែ ឆ្នាំកំណើត"
						width="180"
					>
						<template #default="scope">
							<div>
								{{ scope.row.date_of_birth}}
							</div>
						</template>
					</el-table-column>
					<el-table-column
						label="លេខទូរស័ព្ទ"
						width="120"
					>
						<template #default="scope">
							<div>
								{{ scope.row.phone}}
							</div>
						</template>
					</el-table-column>
					<el-table-column
						fixed="right"
						align="center"
						label="សកម្មភាព"
					>
						<template #default="scope">
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
				<div class="py-2 flex justify-center">
					<el-pagination
						background
						layout="prev, pager, next, sizes"
						:total="tableData.length"
					>
					</el-pagination>
				</div>
			</div>
		</div>
	</div>
	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៌មានគ្រូ"
		titleClass="text-xl font-bold"
		class="sanfont-khmer "
		width="50%"
		align-center="true"
		draggable
	>
		<!-- 
	<div class="flex justify-start item-start pl-[40px] space-y-[20px]">
	<h1 class= "font-bold text-[20px]">ព័ត៌មានគ្រូ</h1>
	</div>-->
		<el-form
			class="grid grid-cols-2"
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>
			<div class="flex flex-col">
				<div class=" item-start ">
					<div>
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
					</div>

				</div>
				<div class="flex flex-row ">
					<div class="flex flex-col space-y-1">
						<div>

							<el-form-item
								label="នាមត្រកូល (ខ្មែរ)"
								prop="firstNameKh"
								class="sanfont-khmer "
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.firstNameKh"
									name="firstNameKh1"
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="នាមខ្លួន (ខ្មែរ)"
								prop="LastNameKh"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.LastNameKh"
									name="LastNameKh1"
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="នាមត្រកូល(អង់គ្លេស)"
								prop="firstNameEng"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.firstNameEng"
									name="firstNameEng1"
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="នាមខ្លួន (អង់គ្លេស)"
								prop="LastNameEng"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.LastNameEng"
									name="LastNameEng1"
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ភេទ"
								prop="gender"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleForm.genderValue"
									placeholder="ជ្រើសរើស"
								>
									<el-option
										v-for="item in gender"
										:key="item.genderValue"
										:label="item.genderLabel"
										:value="item.genderValue"
									>
									</el-option>
								</el-select>
							</el-form-item>
						</div>

						<div>
							<el-form-item
								label="ថ្ងៃ/ខែ/ឆ្នាំកំណើត"
								prop="dobValue"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-date-picker
									v-model="ruleForm.dobValue"
									type="date"
								>
								</el-date-picker>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ទីកន្លែងកំណើត"
								prop="birsthAddress"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.birsthAddress"
									autocomplete="off"
									name="email"
									clearable
								/>
							</el-form-item>
							<el-form-item
								label="អាស័យដ្ឋានបច្ចុប្បន្ន"
								prop="address"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.address"
									autocomplete="off"
									name="email"
									clearable
								/>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ថ្ងៃចូលបង្រៀនដំបូង"
								prop="teachDate"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-date-picker
									v-model="ruleForm.teachDate"
									type="date"
								>
								</el-date-picker>
							</el-form-item>
						</div>

					</div>
					<div class="flex flex-col space-y-1">
						<div>
							<el-form-item
								label="កម្រិត"
								prop="teacher_level"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleForm.teacher_level_value"
									placeholder="ជ្រើសរើស"
								>
									<el-option
										v-for="item in teacher_level"
										:key="item.teacher_level_value"
										:label="item.teacher_level_Label"
										:value="item.teacher_level_value"
									>
									</el-option>
								</el-select>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="មុខវិទ្យា"
								prop="subject"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.address"
									autocomplete="off"
									name="email"
									clearable
								/>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="លេខទូរស័ព្ទ"
								prop="phoneNum"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.phoneNum"
									autocomplete="off"
									type="number"
									name="phoneNum"
									clearable
								/>
							</el-form-item>
						</div>
						<div>
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
						</div>

						<div>
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
						</div>
						<div>
							<el-form-item
								label="តួនាទី"
								prop="roles"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleForm.roles"
									placeholder="ជ្រើសរើស"
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
							<el-form-item
								label="ស្ថានភាព"
								prop="status"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleForm.statusValue"
									placeholder="ជ្រើសរើស"
								>
									<el-option
										v-for="item in status"
										:key="item.statusValue"
										:label="item.statusLabel"
										:value="item.statusValue"
									>
									</el-option>
								</el-select>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ផ្សេងៗ"
								prop="studentOtherText"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									type="textarea"
									:rows="2"
									v-model="ruleForm.studentOtherText"
								>
								</el-input>
							</el-form-item>
						</div>
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
					class="sanfont-khmer "
					type="danger"
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

			ruleForm: {
				name: null,
				roles: null,
				password: null,
				email: null,
				photo_id: null,
				userId: null,
				dobValue: null,
				teachDate: null,

			},
			rules: {
				name: [
					{ required: true, message: 'Please input Activity name', trigger: 'blur' },
					{ min: 3, max: 15, message: 'Length should be 3 to 15', trigger: 'blur' }
				],
				roles: [
					{ required: true, message: 'Please select role', trigger: 'blur' }
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
			search: '',
			filter: [{
				filterValue: 'តាមឈ្មោះ',
				filterLabel: 'ភាសាខ្មែរ'
			}, {
				filterValue: 'តាមលេខរៀង',
				filterLabel: 'គណិតវិទ្យា'
			}, {
				filterValue: 'តាមកាលបរិច្ឆេត',
				filterLabel: 'រូបវិទ្យា'
			}, {
				filterValue: 'តាមទំហំផ្ទុក',
				filterLabel: 'គីមីវិទ្យា'
			}],
			filterSelectValue: "",

			teacher_level: [{
				teacher_level_value: 'មទភ',
				teacher_level_Label: 'មទភ'
			}, {
				teacher_level_value: 'មបភ',
				teacher_level_Label: 'មបភ'
			}],
			teacher_level_Value: "",

			status: [{
				statusValue: 'កំពុងសិក្សា',
				statusLabel: 'កំពុងសិក្សា'
			}, {
				statusValue: 'បញ្ឈប់ការសិក្សា',
				statusLabel: 'បញ្ឈប់ការសិក្សា'
			}],
			statusValue: '',

			gender: [{
				genderValue: 'ប្រុស',
				genderLabel: 'ប្រុស'
			}, {
				genderValue: 'ស្រី',
				genderLabel: 'ស្រី'
			}],
			generValue: '',
			loading: false,
			teacher_levelSelectValue: ''
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
			this.loading = true
			await axios.get('/teacher/get').then(response => {
				this.tableData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async editUser(id) {
			this.dialogFormVisible = true;
			//this.isShowButtonUpdate = true;
			//this.isShowPassword = false;
			//await axios.get('/user/' + id + '/edit').then(response => {
			//this.ruleForm.name = response.data.user.name
			//this.ruleForm.userId = response.data.user.id
			//this.ruleForm.roles = response.data.user_has_roles
			//this.ruleForm.email = response.data.user.email
			//this.imageUrl = response.data.user.img?.file_path
			//this.ruleForm.photo_id = response.data.user.id
			//this.roles = response.data.roles
			//this.dialogFormVisible = true;
			//}).catch((error) => {
			//if (error.response.status == 401) {
			//this.$store.commit("auth/CLEAR_TOKEN")
			//}
			//})
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