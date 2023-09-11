<template>
	<div class="bg-white p-2 w-full flex justify-between border rounded-t">
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
			<!-- <div class="self-start  ">
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
			</div> -->
		</div>

		<div class="self-end">
			<el-switch
				v-model="is_show_trust"
				@change="clickShowwTrush"
				class="px-2"
				width="40"
				active-text="បង្ហាញទិន្នន័យបានលុប"
				inactive-text=""
				active-value="1"
				inactive-value="0"
			/>
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
				<span class="mx-1 sanfont-khmer"> បន្ថែម</span>
			</el-button>
		</div>
	</div>
	<div class="grid grid-cols-1 gap-2 ">
		<div class=" border rounded bg-gray-50">
			<div class="flex flex-col  ">
				<el-table
					:data="tableData.data"
					height="750"
					style="width: 100%"
					resizable="true"
					header-cell-class-name="header-table-font-khmer text-md"
					row-class-name="sanfont-khmer"
					selectable
					v-loading="loading"
					stripe
					highlight-current-row="true"
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
						width="250"
						label="ឈ្មោះ"
					>
						<template #default="scope">{{ scope.row.name }}</template>
					</el-table-column>
					<el-table-column
						property="first_name_en"
						label="កាលបរិច្ជេទ"
						width="320"
					>
						<template #default="scope">{{ scope.row.date?.slice(5, 10)  }}</template>

					</el-table-column>

					<el-table-column
						fixed="right"
						align="center"
						label="សកម្មភាព"
					>
						<template #default="scope">
							<div v-if="is_show_trust==1 &&!loading">
								<el-button
									size="small"
									class="sanfont-khmer"
									@click="restoreData(scope.row.teacher_id)"
								>ស្ដារឡើងវិញ</el-button>
								<el-popconfirm
									width="220"
									confirm-button-text="យល់ព្រម"
									cancel-button-text="ទេ"
									:icon="InfoFilled"
									icon-color="#626AEF"
									title="តើអ្នកពិតជាចង់លុបមែនទេ?"
									@confirm="handleDelete(scope.row.teacher_id)"
								>
									<template #reference>
										<el-button
											size="small"
											type="danger"
											class="sanfont-khmer"
										>លុបជាអចិន្ត្រៃយ៍
										</el-button>
									</template>
								</el-popconfirm>
							</div>

							<div v-if="is_show_trust==0&&!loading">
							<el-button
								size="small"
								class="sanfont-khmer"
								@click="editScoreType(scope.row.score_type_id)"
							>កែប្រែ</el-button>
							<el-popconfirm
								width="220"
								confirm-button-text="យល់ព្រម"
								cancel-button-text="ទេ"
								:icon="InfoFilled"
								icon-color="#626AEF"
								title="តើអ្នកពិតជាចង់លុបមែនទេ?"
								@confirm="handleDelete(scope.row.score_type_id)"
							>	
							<template #reference>
							<el-button
								size="small"
								type="danger"
								class="sanfont-khmer"
								
							>លុប</el-button>
							</template>
						</el-popconfirm>
							</div>
						</template>
					</el-table-column>
					<el-empty description="description"></el-empty>
				</el-table>
				<div class="py-2 flex justify-center">
					<el-pagination
						background
						layout="total, prev, pager, next, sizes"
						:total="tableData.total"
					>
					</el-pagination>
				</div>
			</div>
		</div>
	</div>
	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៌មានប្រភេទពិន្ទុ"
		class="sanfont-khmer "
		width="30%"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានប្រភេទពិន្ទុ</h4>
			</div>
		</template>
		<el-form
			class=""
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>
			<div class="flex flex-col">

				<div class="flex flex-row ">
					<div class="flex flex-col space-y-1">
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
									style="width: 220px;"
									clearable
								
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="កាលបរិច្ជេទ"
								prop="date"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-date-picker
											 v-model="ruleForm.date"
											 name="date" />

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
				date: null,
				scoreType_id: null,


			},
			rules: {
				name: [
					{ required: true, message: 'Please input Activity name', trigger: 'blur' },
					{ min: 3, max: 15, message: 'Length should be 3 to 15', trigger: 'blur' }
				],
				roles: [
					{ required: true, message: 'Please select role', trigger: 'blur' }
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

			//Data Page filter
			is_show_trust: 0
			//Data Page filter

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
			//form.append('role', this.ruleForm.roles)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/score-type/create', form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'Congrats, this is a success message.',
					type: 'success'
				});
			})
		},
		/*
	*  Function update new scoretype
	*/
		async updateData() {

			const form = new FormData(document.getElementById('fm'));
			//form.append('role', this.ruleForm.roles)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/score-type'  + '/update/'+ this.ruleForm.scoreType_id, form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'Congrats, this is a success message.',
					type: 'success'
				});
			})
		},

		clickShowwTrush() {
			this.getData();
			console.log(this.is_show_trust)
		},

		async handleDelete(id) {
			await axios.delete('/score-type' + '/delete/' + id).then(response => {
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
			await axios.get('/score-type/get').then(response => {
				this.tableData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async editScoreType(id) {
			this.dialogFormVisible = true;
			this.isShowButtonUpdate = true;
			this.isShowPassword = false;
			await axios.get('/score-type' + '/edit/'+ id ).then(response => {
			this.ruleForm.scoreType_id = response.data.data.score_type_id
			this.ruleForm.name = response.data.data.name
			this.ruleForm.date = response.data.data.date
			//this.ruleForm.email = response.data.user.email
			//this.imageUrl = response.data.user.img?.file_path
			//this.ruleForm.photo_id = response.data.user.id
			//this.roles = response.data.roles
			//this.dialogFormVisible = true;
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