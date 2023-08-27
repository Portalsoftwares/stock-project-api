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
			<div class="self-start  ">
				<el-select
					v-model="filterSelectValue "
					filterable
					clearable
					multiple
					placeholder="សិស្សនៃកម្រិត"
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
					v-model="academicSelectValue"
					filterable
					clearable
					placeholder="ឆ្នាំសិក្សា"
				>
					<el-option
						v-for="item in academic"
						:key="item.filterValue"
						:label="item.filterLabel"
						:value="item.filterValue"
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
				<span class="mx-1 sanfont-khmer"> បន្ថែមសិស្ស</span>
			</el-button>
		</div>
	</div>
	<div class="grid grid-cols-1 gap-2 ">
		<div class=" border rounded bg-gray-50">
			<div class="flex flex-col  ">
				<!-- {{ tableData }} -->
				<el-table
					:data="tableData.data"
					height="750"
					style="width: 100%"
					resizable="true"
					header-cell-class-name="header-table-font-khmer text-md"
					row-class-name="sanfont-khmer"
					selectable
					v-loading="loading"
					highlight-current-row="true"
					stripe
				>

					<el-table-column
						type="selection"
						width="55"
					/>

					<el-table-column
						type="index"
						width="90"
						align="start"
						label="ល.រ"
						sortable
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
						<template #default="scope">{{ "PK-S00"+ scope.row.student_id}}</template>
					</el-table-column>
					<el-table-column
						width="180"
						label="ឈ្មោះភាសាខ្មែរ"
						sortable
					>
						<template #default="scope">{{scope.row.first_name_kh +" "+scope.row.last_name_kh }}</template>
					</el-table-column>
					<el-table-column
						property="first_name_en"
						label="ឈ្មោះឡាតាំង"
						width="250"
						sortable
					>
						<template #default="scope">{{scope.row.first_name_en +" "+scope.row.last_name_en }}</template>

					</el-table-column>
					<el-table-column
						width="120"
						label="ភេទ"
						:filters="genders"
					>
						<template #default="scope">
							<div v-if="scope.row.gender_id == 1">ប្រុស</div>
							<div v-else>ស្រី</div>
						</template>
					</el-table-column>
					<el-table-column
						width="120"
						label="ថ្នាក់រៀន"
						sortable
					>
						<template #default="scope">
							<div>
								{{ scope.row.current_class?.class.class_name}}
							</div>
						</template>
					</el-table-column>
					<el-table-column label="ថ្ងៃ/ខែ/ឆ្នាំកំណើត">
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
						align="center"
						fixed="right"
						label="សកម្មភាព"
					>
						<template #default="scope">
							<el-button
								size="small"
								class="sanfont-khmer "
								@click="editStudent(scope.row.student_id)"
							>កែប្រែ</el-button>

							<el-popconfirm
								width="220"
								confirm-button-text="OK"
								cancel-button-text="No, Thanks"
								:icon="InfoFilled"
								icon-color="#626AEF"
								title="Are you sure to delete this?"
								@confirm="handleDelete(scope.row.student_id)"
							>
								<template #reference>
									<el-button
										size="small"
										type="danger"
										class="sanfont-khmer"
									>លុប</el-button>
								</template>
							</el-popconfirm>
						</template>
					</el-table-column>
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
		title="ព័ត៌មានសិស្ស"
		class="sanfont-khmer "
		width="50%"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានសិស្ស</h4>
			</div>
		</template>
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
								label="នាមត្រកូល (ខ្មែរ)"
								prop="firstNameKh"
								class="sanfont-khmer "
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.firstNameKh"
									name="first_name_kh"
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
									name="last_name_kh"
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="នាមពេញ (ខ្មែរ)"
								prop="fullNameKh"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.fullNameKh"
									name="full_name_kh"
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
									name="first_name_en"
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
									name="last_name_en"
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="នាមពេញ (អង់គ្លេស)"
								prop="LastNameEng"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.fullNameEng"
									name="full_name_en"
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="អត្តលេខ"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.IDn"
									autocomplete="off"
									name="sid"
									clearable
								/>
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
									name="gender_id"
									value-key="value"
								>
									<el-option
										v-for="item in gender"
										:value-key="item.genderValue"
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
								name="date_of_birth"
							>
								<el-date-picker
									v-model="ruleForm.dobValue"
									type="date"
									name="date_of_birth"
								>
								</el-date-picker>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ទីកន្លែងកំណើត"
								prop="address"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.birsthAddress"
									autocomplete="off"
									name="place_of_birth"
									clearable
								/>
							</el-form-item>
						</div>

						<div>
							<el-form-item
								label="អាស័យដ្ឋានបច្ចុប្បន្ន"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.address"
									autocomplete="off"
									name="address"
									clearable
								/>
							</el-form-item>
						</div>

					</div>
					<div class="flex flex-col space-y-1">
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
										name="file_upload_id"
										v-model="ruleForm.file_upload_id"
									>
								</div>
							</el-form-item>
						</div>

						<div>
							<el-form-item
								label="លេខទូរស័ព្ទ"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.phoneNum"
									autocomplete="off"
									type="number"
									name="phone"
									clearable
								/>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="សារអេឡិចត្រូនិច"
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
								label="ស្ថានភាព"
								prop="status"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleForm.statusValue"
									placeholder="ជ្រើសរើស"
									name="status_id"
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
									:rows="5"
									v-model="ruleForm.studentOtherText"
									name="other"
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
			classData: [],
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
				student_id: null,
				firstNameKh: null,
				LastNameKh: null,
				fullNameKh: null,
				firstNameEng: null,
				LastNameEng: null,
				fullNameEng: null,
				roles: null,
				password: null,
				email: null,
				file_upload_id: null,
				student_id: null,
				genderValue: null,
				dobValue: null,
				address: null,
				phoneNum: null,
				studentOtherText: null,
				statusValue: null,
				IDn: 'PK-S0038',
			},
			rules: {
				firstNameKh: [
					{ required: true, message: 'សូមបញ្ជូលនាមត្រកូល (ខ្មែរ)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				LastNameKh: [
					{ required: true, message: 'សូមបញ្ជូលនាមខខ្លួន (ខ្មែរ)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				firstNameEng: [
					{ required: true, message: 'សូមបញ្ជូលនាមត្រកូល (អង់គ្លេស)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				LastNameEng: [
					{ required: true, message: 'សូមបញ្ជូលនាមខ្លួន (អង់គ្លេស)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				genderValue: [
					{ required: true, message: 'សូមជ្រើសរើសភេទ', trigger: 'blur' },
				],
				dobValue: [
					{ required: true, message: 'សូមបញ្ជូលថ្ងៃខែឆ្នាំកំណើត', trigger: 'blur' },
				],
				roles: [
					{ required: true, message: 'សូមបញ្ជូលតួនាទី', trigger: 'blur' }
				],
				email: [
					{ required: true, message: 'សូមបញ្ជូលសារអេឡិចត្រូនិច', trigger: 'blur' },
					{ type: 'email', message: 'សូមបញ្ជូលសារអេឡិចត្រូនិចឲបានត្រឹមត្រូវ (name@mail.com)', trigger: ['blur', 'change'] }
				],
				password: [
					{ required: true, message: 'សូមបញ្ជូលលេខសម្ងាត់', trigger: 'blur' },
					{ min: 8, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				statusValue: [
					{ required: true, message: 'សូមបញ្ជូលស្ថានភាព', trigger: 'blur' },
				],

				address: [
					{ required: true, message: 'សូមបញ្ជូលអាស័យដ្ឋាន', trigger: 'blur' },

				],
				phoneNum: [
					{ required: true, message: 'សូមបញ្ជូលលេខទូរស័ព្ទ', trigger: 'blur' },
					{ min: 8, message: 'យ៉ាងតិចឲបាន៨តួ', trigger: 'blur' },

				],

			},
			search: '',

			gender: [{
				genderValue: 1,
				genderLabel: 'ប្រុស'
			}, {
				genderValue: 2,
				genderLabel: 'ស្រី'
			}],


			genders: [{
				value: 'ប្រុស',
				text: 'ប្រុស'
			}, {
				value: 'ស្រី',
				text: 'ស្រី'
			}],


			status: [{
				statusValue: '1',
				statusLabel: 'កំពុងសិក្សា'
			}, {
				statusValue: '2',
				statusLabel: 'បញ្ឈប់ការសិក្សា'
			}],
			statusValue: '',

			filter: [{
				filterValue: 'តាមឈ្មោះ',
				filterLabel: 'ទី១០'
			}, {
				filterValue: 'តាមលេខរៀង',
				filterLabel: 'ទី១១'
			}, {
				filterValue: 'តាមកាលបរិច្ឆេត',
				filterLabel: 'ទី១២'
			}],
			academic: [{
				filterValue: 'តាមឈ្មោះ',
				filterLabel: 'ឆ្នាំ២០២១-២០២២'
			}, {
				filterValue: 'តាមលេខរៀង',
				filterLabel: 'ឆ្នាំ២០២២-២០២៣'
			}, {
				filterValue: 'តាមកាលបរិច្ឆេត',
				filterLabel: 'ឆ្នាំ២០២៣-២០២៤'
			}
			],
			filterSelectValue: "",
			academicSelectValue: "",
			loading: false
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
				this.ruleForm.file_upload_id = response.data.file.id
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
			await axios.post('/student/create', form, config).then(response => {
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
			await axios.post('/student' + '/update/' + this.ruleForm.student_id, form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'Congrats, this is a success message.',
					type: 'success'
				});
			})
		},

		/*
		*  Function Delete 
		*/
		async handleDelete(id) {
			await axios.delete('/student' + '/delete/' + id).then(response => {
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
			await axios.get('/student/get').then(response => {
				this.tableData = response.data.data
				this.classData = response.data.class
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async editStudent(id) {
			this.dialogFormVisible = true;
			this.isShowButtonUpdate = true;
			this.isShowPassword = false;
			await axios.get('/student' + '/edit/' + id).then(response => {
				this.ruleForm.student_id = response.data.data.student_id
				this.ruleForm.firstNameKh = response.data.data.first_name_kh
				this.ruleForm.LastNameKh = response.data.data.last_name_kh
				this.ruleForm.fullNameKh = response.data.data.full_name_kh
				this.ruleForm.firstNameEng = response.data.data.first_name_en
				this.ruleForm.LastNameEng = response.data.data.last_name_en
				this.ruleForm.fullNameEng = response.data.data.full_name_en
				this.ruleForm.IDn = response.data.data.sid
				this.ruleForm.genderValue = response.data.data.gender_id
				this.ruleForm.dobValue = response.data.data.date_of_birth
				this.ruleForm.birsthAddress = response.data.data.place_of_birth
				this.ruleForm.address = response.data.data.address
				this.ruleForm.phoneNum = response.data.data.phone
				this.ruleForm.firstNameKh = response.data.data.first_name_kh
				this.ruleForm.email = response.data.data.email
				this.ruleForm.statusValue = response.data.data.status_id
				this.ruleForm.studentOtherText = response.data.data.other
				//	this.ruleForm.roles = response.data.data.role
				this.imageUrl = response.data.data.profile_img?.file_path
				this.ruleForm.file_upload_id = response.data.data.file_upload_id
				//	this.roles = response.data.roles

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