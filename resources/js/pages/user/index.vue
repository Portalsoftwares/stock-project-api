<template>
	<div class="bg-white p-2 w-full flex flex-col justify-between border rounded-t lg:flex-row">
		<div class="flex space-x-2">
			<div class="self-center">
				<el-input
					placeholder="ស្វែងរក"
					class="sanfont-khmer"
					v-model="search"
					@input="clickSearch"
				>
				</el-input>
			</div>
			<div class="hidden">
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
		<div class="flex flex-col  xl:flex-row ">
		<div class="self-center flex">
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
		</div>	
		<div class="self-center ">
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
				<span class="mx-1 sanfont-khmer"> បន្ថែមអ្នកប្រើប្រាស់</span>
			</el-button>
		</div>
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
					stripe
					highlight-current-row="true"
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
						<template #default="scope">{{scope.row.id }}</template>
					</el-table-column>
					<el-table-column
						property="profile"
						label="រូបភាព"
						width="100"
					>
						<template #default="scope">
							<el-image
								style="width: 40px; height: 40px"
								:src="scope.row.img?.file_path"
								fit="cover"
								:lazy="true"
								class="rounded-full"
							/>
						</template>
					</el-table-column>
					<el-table-column
						label="ឈ្មោះ"
						sortable
					>
						<template #default="scope">{{ scope.row.name }}</template>
					</el-table-column>
					<el-table-column
						property="email"
						label="សារអេឡិចត្រូនិច"
						width="300"
					/>

					<el-table-column
						label="លេខទូរស័ព្ទ"
						property="phone"
					>
					</el-table-column>

					<el-table-column
						property="roles"
						label="តួនាទី"
						width="350"
					>
						<template #default="scope">
							<div class="flex space-x-1 min-w-[200px]">
								<div
									v-for="data in scope.row.roles "
									:key="data.id"
								>
									<el-tag
										type="info"
										disable-transitions
									>{{ data.name }}</el-tag>
								</div>
							</div>
						</template>
					</el-table-column>

					<el-table-column
						fixed="right"
						align="center"
						label="សកម្មភាព"
					>
						<template #default="scope">

							<div v-if="scope.row.is_system!=1">
								<div v-if="is_show_trust==1 &&!loading">
									<el-button
										size="small"
										class="sanfont-khmer"
										@click="restoreData(scope.row.id)"
									>ស្ដារឡើងវិញ</el-button>
									<el-popconfirm
										width="220"
										confirm-button-text="យល់ព្រម"
										cancel-button-text="ទេ"
										:icon="InfoFilled"
										icon-color="#626AEF"
										title="តើអ្នកពិតជាចង់លុបមែនទេ?"
										@confirm="handleDelete(scope.row.id)"
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
										@click="editUser(scope.row.id)"
									>កែប្រែ</el-button>
									<el-popconfirm
										width="220"
										confirm-button-text="យល់ព្រម"
										cancel-button-text="ទេ"
										:icon="InfoFilled"
										icon-color="#626AEF"
										title="តើអ្នកពិតជាចង់លុបមែនទេ?"
										@confirm="handleDelete(scope.row.id)"
									>
										<template #reference>
											<el-button
												size="small"
												type="danger"
												class="sanfont-khmer"
											>លុប
											</el-button>
										</template>
									</el-popconfirm>
								</div>
							</div>
							<div v-if="scope.row.is_system==1">
								<el-icon :size="20">
									<Lock />
								</el-icon>
							</div>

						</template>
					</el-table-column>
				</el-table>
				<div class="py-2 flex justify-center">
					<el-pagination
						background
						v-model:current-page="page"
						v-model:page-size="per_page"
						:page-count="tableData.last_page"
						layout="total, prev, pager, next, sizes"
						:total="tableData.total"
						@current-change="changePage"
						@size-change="changePageSize"
					>
					</el-pagination>
				</div>
			</div>
		</div>
	</div>
	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៌មានអ្នកប្រើប្រាស់"
		class="sanfont-khmer"
		width="50%"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានអ្នកប្រើប្រាស់</h4>
			</div>
		</template>
		<el-form
			class="xl:grid xl:grid-cols-2"
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>
			<div>
				<el-form-item
					label="គណនីនៃគ្រូបង្រៀន"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleForm.teacher_id"
						placeholder="ជ្រើសរើស"
						class="text-left"
						@change="selectTeacher"
						filterable
					>
						<el-option
							v-for="data in teachers"
							:key="data.teacher_id"
							:label="data.full_name_kh"
							:value="data.teacher_id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="ឈ្មោះ"
					prop="name"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.name"
						autocomplete="off"
						name="name"
						clearable
					></el-input>
				</el-form-item>
				<el-form-item
					label="លេខទូរស័ព្ទ"
					prop="phone"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.phone"
						autocomplete="off"
						name="phone"
						clearable
					/>
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
						autocomplete="off"
						name="password"
						show-password
					/>
				</el-form-item>
				<el-form-item
					label="តួនាទី"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleForm.roles"
						placeholder="ជ្រើសរើស"
						class="text-left"
						name="roles"
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
						:show-file-list="false"
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
import FileSaver from 'file-saver'
export default {
	components: { FileSaver },
	data() {
		return {
			tableData: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			roles: null,
			teachers: [],
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
				phone: null,
				roles: null,
				password: null,
				email: null,
				teacher_id: null,
				photo_id: null,
				userId: null
			},
			rules: {
				name: [
					{ required: true, message: 'សូមបញ្ចូលឈ្មោះ', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចាប់ពី ៣តួ ទៅ ១៥តួអក្សរ', trigger: 'blur' }
				],
				roles: [
					{ required: true, message: 'សូមបញ្ចូលតួនាទី', trigger: 'change' }
				],
				email: [
					{ required: true, message: 'សូមបញ្ចូលសារអេឡិចត្រូនិច', trigger: 'blur' },
					{ type: 'email', message: 'ប្រភេទសារអេឡិចត្រូនិច', trigger: ['blur', 'change'] }
				],
				password: [
					{ required: true, message: 'សូមបញ្ចូលដាក់ពាក្សសម្ងាត់', trigger: 'blur' },
					{ min: 8, max: 15, message: 'ចាប់ពី ៣តួ ទៅ ១៥តួអក្សរ', trigger: 'blur' }
				],
				photo_id: [
					{ required: true, message: 'សូមដាក់រូបភាព', trigger: 'change' }
				],
			},
			filterSelectValue: "",
			loading: false,

			//Data Page filter
			page: 1,
			per_page: 10,
			sort_by: 'id',
			order_by: 1,
			filter_profession: [],
			filter_teacher_level: 1,
			search: '',
			tSearch: null,
			is_show_trust: 0
			//Data Page filter

		}
	},
	mounted() {
		this.getData()
	},
	methods: {
		selectTeacher(event) {
			// this.ruleForm.teacher_id = event.teacher_id.toString()
			// this.ruleForm.name = event.last_name_en
		},
		//Change Per Page
		changePageSize(event) {
			this.per_page = event;
			this.getData();

		},
		//Chnage Page 
		changePage(event) {
			this.page = event;
			this.getData();
		},

		// ស្វែងរក ទិន្នន័យ
		clickSearch() {
			clearTimeout(this.tSearch);
			this.tSearch = setTimeout(() => {
				if (this.search != null) {
					if (this.search.replace(/\s/g, '') !== '') {
					}
					this.getData();
				}
			}, 1000);
		},
		clickShowwTrush() {
			this.getData();
			console.log(this.is_show_trust)
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
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
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
			form.append('teacher_id', this.ruleForm.teacher_id)
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
		async updateData() {
			const form = new FormData(document.getElementById('fm'));
			form.append('role', this.ruleForm.roles)
			form.append('teacher_id', this.ruleForm.teacher_id)

			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/user/update/' + this.ruleForm.userId, form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
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
			this.ruleForm.phone = ''
			this.ruleForm.userId = ''
			this.ruleForm.roles = null
			this.ruleForm.email = ''
			this.imageUrl = ''
			this.ruleForm.photo_id = ''
			this.ruleForm.teacher_id = ''
			this.roles = null

			this.dialogFormVisible = true
			this.isShowButtonUpdate = false;
			this.isShowPassword = true;

			await axios.get('/user/create').then(response => {
				this.roles = response.data.roles
				this.teachers = response.data.teachers
			}).catch((error) => {
				console.log(error)
			})
		},
		async getData() {
			this.loading = true
			await axios.get(`/user/get?page=${this.page}&per_page=${this.per_page}&sort_by=${this.sort_by}&order_by=${this.order_by}&search=${this.search}&is_show_trust=${this.is_show_trust}`).then(response => {
				this.tableData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async editUser(id) {
			this.isShowButtonUpdate = true;
			this.isShowPassword = false;
			await axios.get('/user/edit/' + id).then(response => {
				this.ruleForm.name = response.data.user.name
				this.ruleForm.phone = response.data.user.phone
				this.ruleForm.userId = response.data.user.id
				this.ruleForm.roles = response.data.user_has_roles
				this.ruleForm.email = response.data.user.email
				this.ruleForm.teacher_id = response.data.user.teacher_id
				this.imageUrl = response.data.user.img?.file_path
				this.ruleForm.photo_id = response.data.user.img?.file_upload_id
				this.roles = response.data.roles
				this.teachers = response.data.teachers

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
				message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
				type: 'success',
			})
		},

		async handleDelete(id) {
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.delete('/user/delete/' + id, config).then(response => {
				this.getData()

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		// async restoreData(id) {
		// 	await axios.post('/user/restore/' + id).then(response => {
		// 		this.getData();
		// 		this.dialogFormVisible = false;
		// 		this.$message({
		// 			message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
		// 			type: 'success'
		// 		});
		// 	})
		// },
		async restoreData() {
			axios.post('/user/restore/1', {
				file_name: 'User'
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'user');
			});
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

.mr-820 {
	margin-right: 820px;
}
</style>