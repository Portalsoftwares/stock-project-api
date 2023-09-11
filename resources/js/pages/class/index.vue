<template>
	<div class="bg-white p-2 flex justify-between border rounded-t">
		<div class="flex space-x-2">
			<div class="self-start ">
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
					placeholder="កម្រិត"
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
					v-model="filterSelectValue "
					filterable
					clearable
					multiple
					placeholder="ប្រភេទថ្នាក់"
				>
					<el-option
						v-for="item in classType"
						:key="item.id"
						:label="item.name"
						:value="item.id"
					>
					</el-option>
				</el-select>
			</div>
			<div class="self-start  ">
				<el-select
					v-model="academicSelectValue"
					filterable
					clearable
					placeholder="ឆ្នាំសិក្សា"
				>
					<el-option
						v-for="item in academic"
						:key="item.id"
						:label="item.name"
						:value="item.id"
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

			<div class="flex space-x-2">
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
					<span class="mx-1 sanfont-khmer"> បន្ថែមថ្នាក់</span>
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
						:data="tableData.data"
						height="750"
						style="width: 100%"
						resizable="true"
						fit
						header-cell-class-name="header-table-font-khmer text-md"
						row-class-name="sanfont-khmer"
						selectable
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
							<template #default="scope">{{scope.row.class_id }}</template>
						</el-table-column>

						<el-table-column label="ឈ្មោះថ្នាក់">
							<template #default="scope">{{ scope.row.class_name }}</template>
						</el-table-column>
						<el-table-column label="គ្រូសរុប">
							<template #default="scope">{{ scope.row.get_teacher_in_class.length }} នាក់
							</template>
						</el-table-column>
						<el-table-column label="សិស្សសរុប">
							<template #default="scope">{{ scope.row.count_student_in_class.length }} នាក់
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
							align="center"
						>
							<template #default="scope">
								<router-link
									:to="'/class-detail?id='+scope.row.class_id"
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
		title="ព័ត៌មានថ្នាក់រៀន"
		class="sanfont-khmer"
		width="30%"
		align-center="true"
		draggable
	>

		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានថ្នាក់រៀន</h4>
			</div>
		</template>
		<el-form
			class="grid grid-cols-2"
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>
			<div>
				<el-form-item
					label="ឈ្មោះថ្នាក់រៀន"
					prop="class_name"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.class_name"
						name="name"
						disabled
					></el-input>
				</el-form-item>
				<el-form-item
					label="ឆ្នាំសិក្សា"
					prop="academic_id"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleForm.academic_id"
						placeholder="ជ្រើសរើស"
						class="text-left "
					>
						<el-option
							v-for="data in academic"
							:key="data"
							:label="data.name"
							:value="data.id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="កម្រិតថ្នាក់"
					class="sanfont-khmer"
					prop="grade_level_id"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="gradeLevelId"
						value-key="id"
						placeholder="ជ្រើសរើស"
						class="text-left "
						@change="getNameClass()"
					>
						<el-option
							v-for="data in gradeLevel"
							:key="data"
							:label="data.name"
							:value="data"
						/>
					</el-select>
				</el-form-item>

				<el-form-item
					label="អក្សរសម្គាល់"
					class="sanfont-khmer"
					prop="class_symbol"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleForm.class_symbol"
						placeholder="ជ្រើសរើស"
						class="text-left "
						@change="getNameClass()"
					>
						<el-option
							v-for="data in nameSimble"
							:key="data"
							:label="data.name"
							:value="data.name"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="ប្រភេទថ្នាក់"
					class="sanfont-khmer"
					prop="class_type_id"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleForm.class_type_id"
						placeholder="ជ្រើសរើស"
						class="text-left"
					>
						<el-option
							v-for="data in classType"
							:key="data"
							:label="data.name"
							:value="data.id"
							:disabled="item?.disabled"
						/>
					</el-select>
				</el-form-item>
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
			formLabelWidth: "120px",
			dialogImageUrl: "",
			dialogVisible: false,
			files: {},
			form: {},
			imageUrl: '',
			isShowPassword: true,
			isShowButtonUpdate: false,
			showDataAs: "Table",
			ruleForm: {
				class_name: null,
				class_type_id: null,
				grade_level_id: null,
				academic_id: null,
				class_symbol: null
			},
			rules: {
				class_name: [
					{ required: true, message: 'សូមបញ្ចូលឈ្មោះថ្នាក់' },
				],
				class_symbol: [
					{ required: true, message: 'សូមបញ្ចូលឈ្មោះថ្នាក់', trigger: 'change' },
				],
				class_type_id: [
					{ required: true, message: 'សូមបញ្ចូលប្រភេទថ្នាក់', trigger: 'change' }
				],
				grade_level_id: [
					{ required: true, message: 'សូមបញ្ចូលកម្រិតថ្នាក់', trigger: 'change' },
				],
				academic_id: [
					{ required: true, message: 'សូមបញ្ចូលឆ្នាំសិក្សា', trigger: 'change' },
				],

			},
			search: '',
			academic: [
				{
					name: 'ឆ្នាំសិក្សា២០២១-២០២២',
					id: '1'
				},
				{
					name: 'ឆ្នាំសិក្សា២០២២-២០២៣',
					id: 2
				},
				{
					name: 'ឆ្នាំសិក្សា២០២៣-២០២៤',
					id: 3
				},
			],
			gradeLevel: [
				{
					name: '10',
					id: '1'
				},
				{
					name: '11',
					id: 2
				},
				{
					name: '12',
					id: 3
				},
			],
			classType: [
				{
					name: 'ធម្មតា',
					id: '1',
					disabled: true,
				},
				{
					name: 'ថ្នាក់វិទ្យាសាស្រ្តពិត',
					id: 2,
					disabled: true,
				},
				{
					name: 'ថ្នាក់វិទ្យាសាស្រ្តសង្គម',
					id: 3,
					disabled: true,
				},
			],
			nameSimble: [
				{
					name: 'A',
					id: '1'
				},
				{
					name: 'B',
					id: 2
				},
				{
					name: 'C',
					id: 3
				},
				{
					name: 'D',
					id: 4
				},
				{
					name: 'E',
					id: 5
				},
			],
			gradeLevelId: null,
			nameClass: '',

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
		}
	},
	mounted() {
		this.getData()
	},
	methods: {
		getNameClass() {
			this.ruleForm.grade_level_id = this.gradeLevelId?.id
			this.ruleForm.class_name = (this.gradeLevelId?.name ?? '') + " " + (this.ruleForm.class_symbol ?? '');
		},
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
					// this.resetForm('ruleForm')
				} else {
					this.$notify.error({
						title: 'កំហុស',
						message: 'បញ្ចូលមិនបានជោគជ័យទេ 😓',
						showClose: true
					});
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
			const data = {
				'class_name': this.ruleForm.class_name,
				'class_type_id': this.ruleForm.class_type_id,
				'grade_level_id': this.ruleForm.grade_level_id,
				'academic_id': this.ruleForm.academic_id,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}

			await axios.post('/class/store', data, config).then(response => {
				this.dialogFormVisible = false;
				this.$notify.success({
					title: 'ព័ត៌មាន',
					message: 'បញ្ចូលបានជោគជ័យ 😊',
					showClose: true
				});
				this.getData();
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
			await axios.get('/class/get').then(response => {
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
			this.dialogFormVisible = true;
			//}).catch((error) => {
			//if (error.response.status == 401) {
			//	this.$store.commit("auth/CLEAR_TOKEN")
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