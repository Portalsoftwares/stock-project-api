<template>
	<el-tabs type="border-card">
		<el-tab-pane label="មុខវិជ្ជាទូទៅ">
			<div class="bg-white p-2 w-full flex justify-between">
				<div class="flex space-x-2">
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
					<div class="self-start hidden ">
						<el-select
							v-model="filterSelectValue"
							filterable
							placeholder="តម្រៀប"
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
						<span class="mx-1 sanfont-khmer"> បន្ថែមមុខវិជ្ជា</span>
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
							height="690"
							style="width: 100%"
							resizable="true"
							header-cell-class-name="header-table-font-khmer text-md"
							row-class-name="sheader-table-font-khmer"
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
								<template #default="scope">{{scope.row.subject_id }}</template>
							</el-table-column>

							<el-table-column
								label="មុខវិជ្ជា"
								sortable
							>
								<template #default="scope">{{ scope.row.subject_name_kh }}</template>
							</el-table-column>
							<el-table-column
								label="មុខវិជ្ជា (អង់គ្លេស)"
								sortable
							>
								<template #default="scope">{{ scope.row.subject_name_en }}</template>
							</el-table-column>
							<el-table-column
								label="មុខវិជ្ជា (អក្សរកាត់)"
								sortable
							>
								<template #default="scope">{{ scope.row.subject_sort_name_en }}</template>
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
							layout="total, prev, pager, next, sizes"
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
				title="ព័ត៌មានមុខវិជ្ជា"
				class="sanfont-khmer"
				width="30%"
				align-center="true"
				draggable
			>
				<el-form
					class="grid grid-cols-2"
					:model="ruleForm"
					:rules="rules"
					ref="ruleForm"
					id="fm"
				>

					<div class="flex flex-row ">
						<div class="flex flex-col space-y-1">
							<div>
								<el-form-item
									label="ឈ្មោះមុខវិជ្ជា (ខ្មែរ)"
									prop="subjectKhName"
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
									label="ឈ្មោះមុខវិជ្ជា (អង់គ្លេស)"
									prop="subjectEngName"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.subjectEngName"
										name="subjectEngName"
										clearable
									></el-input>
								</el-form-item>
							</div>
							<div>
								<el-form-item
									label="ឈ្មោះមុខវិជ្ជា (អក្សរកាត់)"
									prop="subjectShortName"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.subjectShortName"
										name="subjectShortName"
										clearable
									></el-input>
								</el-form-item>
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
		</el-tab-pane>
		<el-tab-pane label="មុខវិជ្ជាតាមកម្រិត">
			<div class="bg-white p-2 w-full flex justify-between">
				<div class="flex space-x-2">
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
					<div class="self-start  ">
						<el-select
							v-model="filterSelectValue "
							filterable
							clearable
							multiple
							placeholder="មុខវិជ្ជានៃកម្រិត"
						>
							<el-option
								v-for="item in gradeLevel"
								:key="item.gradeLevelValue"
								:label="item.gradeLevelLabel"
								:value="item.gradeLevelValue"
							>
							</el-option>
						</el-select>
					</div>
					<div class="self-start  ">
						<el-select
							v-model="SelectValue "
							filterable
							clearable
							multiple
							placeholder="ប្រភេទថ្នាក់"
						>
							<el-option
								v-for="item in classType"
								:key="item.classTypeValue"
								:label="item.classTypeLabel"
								:value="item.classTypeValue"
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

						<span class="mx-1 sanfont-khmer"> បន្ថែមមុខវិជ្ជាតាមកម្រិត</span>

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
							:data="tableDataSubjectLevel"
							height="690"
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

							<el-table-column label="មុខវិជ្ជា">
								<template #default="scope">{{ scope.row.subject.subject_name_kh }}</template>
							</el-table-column>
							<el-table-column label="កម្រិត">

								<template #default="scope">{{ scope.row.grade_level.grade_level_name }}</template>
							</el-table-column>
							<el-table-column
								label="ប្រភេទថ្នាក់"
								sortable
							>
								<template #default="scope">{{ scope.row.class_type.name }}</template>
							</el-table-column>
							<el-table-column label="ពិន្ទុពេញ">
								<template #default="scope">{{ scope.row.full_score }}</template>
							</el-table-column>
							<el-table-column label="មេគុណ">
								<template #default="scope">{{ scope.row.divide }}</template>
							</el-table-column>
							<el-table-column label="មធ្យមភាគ">
								<template #default="scope">{{ scope.row.average }}</template>
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
								:total="tableDataSubjectLevel.length"
							>
							</el-pagination>
						</div>
					</div>
				</div>
			</div>

			<!-- Dialog  -->
			<el-dialog
				v-model="dialogFormVisible"
				title="ព័ត៌មានមុខវិជ្ជាតាមកម្រិត"
				class="sanfont-khmer "
				width="30%"
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

						</div>
						<div class="flex flex-row ">
							<div class="flex flex-col space-y-1">
								<div>

									<el-form-item
										label="ឈ្មោះមុខវិជ្ជា (ខ្មែរ)"
										prop="subjectKhName"
										class="sanfont-khmer "
										:label-width="formLabelWidth"
									>
										<el-select
											v-model="ruleForm.firstNameKh"
											placeholder="ជ្រើសរើស"
										>

										</el-select>
									</el-form-item>
								</div>
								<div>
									<el-form-item
										label="កម្រិតថ្នាក់"
										prop="gradeLevel"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-select
											v-model="ruleForm.gradeLevelalue"
											placeholder="ជ្រើសរើស"
										>
											<el-option
												v-for="item in gradeLevel"
												:key="item.gradeLevelValue"
												:label="item.gradeLevelLabel"
												:value="item.gradeLevelValue"
											>
											</el-option>
										</el-select>
									</el-form-item>
								</div>
								<div>
									<el-form-item
										label="ប្រភេទថ្នាក់"
										prop="classType"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-select
											v-model="ruleForm.classTypeValue"
											placeholder="ជ្រើសរើស"
										>
											<el-option
												v-for="item in classType"
												:key="item.classTypeValue"
												:label="item.classTypeLabel"
												:value="item.classTypeValue"
											>
											</el-option>
										</el-select>
									</el-form-item>
								</div>
								<div>
									<el-form-item
										label="ពិន្ទុពេញ"
										prop="fullScore"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-input
											v-model="ruleForm.fullScore"
											autocomplete="off"
											type="number"
											name="fullScore"
											clearable
										/>
									</el-form-item>
								</div>

								<div>
									<el-form-item
										label="មេគុណ"
										prop="devide"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-input
											v-model="ruleForm.devide"
											autocomplete="off"
											type="number"
											name="devide"
											clearable
										/>
									</el-form-item>
								</div>
								<div>
									<el-form-item
										label="មធ្យមភាគ"
										prop="devide"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-input
											v-model="ruleForm.devide"
											autocomplete="off"
											type="number"
											name="devide"
											clearable
										/>
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

		</el-tab-pane>
	</el-tabs>

</template>
<script>
export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
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
			search: '',

			filter: [{
				filterValue: 'តាមឈ្មោះ',
				filterLabel: 'តាមឈ្មោះ'
			}, {
				filterValue: 'តាមលេខរៀង',
				filterLabel: 'តាមលេខរៀង'
			}, {
				filterValue: 'តាមកាលបរិច្ឆេត',
				filterLabel: 'តាមកាលបរិច្ឆេត'
			}, {
				filterValue: 'តាមទំហំផ្ទុក',
				filterLabel: 'តាមទំហំផ្ទុក'
			}],
			filterSelectValue: "",

			gradeLevel: [{
				gradeLevelValue: '10',
				gradeLevelLabel: 'ទី10'
			}, {
				gradeLevelValue: '11',
				gradeLevelLabel: 'ទី11'
			},
			{
				gradeLevelValue: '12',
				gradeLevelLabel: 'ទី12'
			}],
			gradeLevelValue: '',

			classType: [{
				classTypeValue: 'ធម្មតា',
				classTypeLabel: 'ធម្មតា'
			}, {
				classTypeValue: 'វិជ្ជាសាស្រ្តពិក',
				classTypeLabel: 'វិជ្ជាសាស្រ្តពិក'
			},
			{
				classTypeValue: 'វិជ្ជាសាស្រ្តសង្គម',
				classTypeLabel: 'វិជ្ជាសាស្រ្តសង្គម'
			}],
			classTypeValue: '',
		}
	},
	mounted() {
		this.getData();
		this.getDataSubjectLevel()
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
			//this.ruleForm.name = ''
			//this.ruleForm.userId = ''
			//this.ruleForm.roles = ''
			//this.ruleForm.email = ''
			//this.imageUrl = ''
			//this.ruleForm.photo_id = ''
			//this.roles = null

			this.dialogFormVisible = true
			//this.isShowButtonUpdate = false;
			//this.isShowPassword = true;

			//await axios.get('/user/create').then(response => {
			//this.roles = response.data.roles
			//}).catch((error) => {
			//console.log(error)
			//})
		},
		async getData() {
			this.loading = true
			await axios.get('/subject/get').then(response => {
				this.tableData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async getDataSubjectLevel() {
			this.loading = true

			await axios.get('/subject/get_subject_level').then(response => {
				this.tableDataSubjectLevel = response.data.data
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

			//}).catch((error) => {
			//	if (error.response.status == 401) {
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