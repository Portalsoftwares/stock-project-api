<template>
	<div class="bg-white p-2 w-full border justify-between rounded-t xl:flex xl:flex-row">
		<div class="flex  flex-col space-y-2  ">
			<div class="flex space-x-2 ">
				<div class="self-center pr-2">
					<el-input placeholder="ស្វែងរក" class="sanfont-khmer" v-model="search" @input="clickSearch">
					</el-input>
				</div>

			</div>
			<div class="flex space-y-2  2xl:space-y-0 ">
				<div class="self-center ">
					<el-select v-model="filterSelectValue" filterable clearable multiple placeholder="សិស្សនៃកម្រិត">
						<el-option v-for="item in filter" :key="item.filterValue" :label="item.filterLabel"
							:value="item.filterValue">
						</el-option>
					</el-select>
				</div>

				<div class="flex space-x-2 ">
					<div class="self-center pl-2">
						<el-select v-model="academicSelectValue" filterable clearable placeholder="ឆ្នាំសិក្សា">
							<el-option v-for="item in academic" :key="item.filterValue" :label="item.filterLabel"
								:value="item.filterValue">
							</el-option>
						</el-select>
					</div>
					<div class="self-center">
						<el-button type="primary">
							<el-icon>
								<Search />
							</el-icon>
						</el-button>
					</div>
				</div>
			</div>
		</div>

		<div class="flex flex-col  3xl:flex-row space-y-2 ">
			<div class="self-end flex ">
				<el-switch v-model="is_show_trust" @change="clickShowwTrush" class="px-2" width="40"
					active-text="បង្ហាញទិន្នន័យបានលុប" inactive-text="" active-value="1" inactive-value="0" />
			</div>
			<div class="self-center ">
				<el-button type="info" style="width:111px" @click="exportExcel">
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ Excel</span>

				</el-button>
				<el-button type="info" @click="exportPDF">
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>

				</el-button>
				<el-button type="primary" @click="addStudent">
					<el-icon>
						<CirclePlusFilled />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> បន្ថែមសិស្ស</span>
				</el-button>
			</div>
		</div>
	</div>
	<div class="grid grid-cols-1 gap-2 ">
		<div class=" border rounded bg-gray-50">
			<div class="flex flex-col  ">
				<!-- {{ tableData }} -->
				<el-table :data="tableData.data" height="730" style="width: 100%" resizable="true"
					header-cell-class-name="header-table-font-khmer text-md" row-class-name="sanfont-khmer" selectable
					v-loading="loading" highlight-current-row="true" stripe>

					<el-table-column type="selection" width="55" />

					<el-table-column type="index" width="90" align="start" label="ល.រ" sortable>
					</el-table-column>

					<el-table-column width="100" align="start" label="រូបភាព">
						<template #default="scope">
							<el-image style="width: 40px; height: 40px" :src="scope.row.profile_img?.file_path" fit="cover"
								:lazy="true" class="rounded-full" />
						</template>
					</el-table-column>

					<el-table-column width="100" align="start" label="អត្តលេខ" sortable>
						<template #default="scope">{{ "PK-S00" + scope.row.student_id }}</template>
					</el-table-column>
					<el-table-column width="180" label="ឈ្មោះភាសាខ្មែរ" sortable>
						<template #default="scope">{{ scope.row.full_name_kh }}</template>
					</el-table-column>
					<el-table-column property="first_name_en" label="ឈ្មោះឡាតាំង" width="220" sortable>
						<template #default="scope">{{ scope.row.full_name_en }}</template>

					</el-table-column>
					<el-table-column width="130" label="ភេទ" :filters="genders">
						<template #default="scope">
							<div v-if="scope.row.gender_id == 1">ប្រុស</div>
							<div v-else>ស្រី</div>
						</template>
					</el-table-column>
					<el-table-column width="150" label="ថ្នាក់រៀន" sortable>
						<template #default="scope">
							<div>
								{{ scope.row.current_class?.class.class_name }}
							</div>
						</template>
					</el-table-column>
					<el-table-column label="ថ្ងៃ/ខែ/ឆ្នាំកំណើត">
						<template #default="scope">
							<div>
								{{ scope.row.date_of_birth }}
							</div>
						</template>
					</el-table-column>
					<el-table-column label="លេខទូរស័ព្ទ" width="170">
						<template #default="scope">
							<div>
								{{ scope.row.phone }}
							</div>
						</template>
					</el-table-column>
					<el-table-column width="220" align="center" fixed="right" label="សកម្មភាព">
						<template #default="scope">
							<div v-if="is_show_trust == 1 && !loading">
								<el-button size="small" class="sanfont-khmer"
									@click="restoreData(scope.row.student_id)">ស្ដារឡើងវិញ</el-button>
								<el-popconfirm width="220" confirm-button-text="យល់ព្រម" cancel-button-text="ទេ"
									:icon="InfoFilled" icon-color="#626AEF" title="តើអ្នកពិតជាចង់លុបមែនទេ?"
									cancel-button-type="info" @confirm="handleDelete(scope.row.student_id)">
									<template #reference>
										<el-button size="small" type="danger" class="sanfont-khmer">លុបជាអចិន្ត្រៃយ៍
										</el-button>
									</template>
								</el-popconfirm>
							</div>
							<div v-if="is_show_trust == 0 && !loading">
								<el-button size="small" class="sanfont-khmer"
									@click="editStudent(scope.row.student_id)">កែប្រែ</el-button>
								<el-popconfirm width="220" confirm-button-text="យល់ព្រម" cancel-button-text="ទេ"
									:icon="InfoFilled" icon-color="#626AEF" title="តើអ្នកពិតជាចង់លុបមែនទេ?"
									cancel-button-type="info" @confirm="handleDelete(scope.row.student_id)">
									<template #reference>
										<el-button size="small" type="danger" class="sanfont-khmer">លុប
										</el-button>
									</template>
								</el-popconfirm>
							</div>
						</template>
					</el-table-column>
				</el-table>
				<div class="py-2 flex justify-center">
					<el-pagination background v-model:current-page="page" v-model:page-size="per_page"
						:page-count="tableData.last_page" layout="total, prev, pager, next, sizes" :total="tableData.total"
						@current-change="changePage" @size-change="changePageSize">
					</el-pagination>

				</div>
			</div>
		</div>
	</div>
	<!-- Dialog  -->
	<el-dialog v-model="dialogFormVisible" title="ព័ត៌មានសិស្ស" class="sanfont-khmer " width="50%" align-center="true"
		draggable>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានសិស្ស</h4>
			</div>
		</template>
		<el-form :model="ruleForm" :rules="rules" ref="ruleForm" id="fm">
			<el-tabs type="card" @tab-click="handleClick" style="height: 650px; overflow: auto;">
				<el-tab-pane label="ព័ត៌មានទូទៅ">

					<div class="flex flex-col w-full">
						<div class="xl:flex xl:flex-row ">
							<div class="flex flex-col space-y-1">
								<div>

									<el-form-item label="នាមត្រកូល (ខ្មែរ)" prop="firstNameKh" class="sanfont-khmer "
										:label-width="formLabelWidth">
										<el-input v-model="ruleForm.firstNameKh" name="first_name_kh" clearable></el-input>
									</el-form-item>
								</div>
								<div>
									<el-form-item label="នាមខ្លួន (ខ្មែរ)" prop="LastNameKh" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-input v-model="ruleForm.LastNameKh" name="last_name_kh" clearable></el-input>
									</el-form-item>
								</div>
								<div>
									<el-form-item label="នាមពេញ (ខ្មែរ)" prop="fullNameKh" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-input v-model="ruleForm.fullNameKh" name="full_name_kh" clearable></el-input>
									</el-form-item>
								</div>
								<div>
									<el-form-item label="នាមត្រកូល(អង់គ្លេស)" prop="firstNameEng" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-input v-model="ruleForm.firstNameEng" name="first_name_en" clearable></el-input>
									</el-form-item>
								</div>
								<div>
									<el-form-item label="នាមខ្លួន (អង់គ្លេស)" prop="LastNameEng" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-input v-model="ruleForm.LastNameEng" name="last_name_en" clearable></el-input>
									</el-form-item>
								</div>
								<div>
									<el-form-item label="នាមពេញ (អង់គ្លេស)" prop="fullNameEng" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-input v-model="ruleForm.fullNameEng" name="full_name_en" clearable></el-input>
									</el-form-item>
								</div>
								<div>
									<el-form-item label="អត្តលេខ" class="sanfont-khmer" :label-width="formLabelWidth">
										<el-input v-model="ruleForm.IDn" autocomplete="off" name="sid" clearable />
									</el-form-item>
								</div>
								<div>
									<el-form-item label="ភេទ" prop="gender" class="sanfont-khmer"
										:label-width="formLabelWidth">

										<el-select v-model="ruleForm.genderValue" placeholder="ជ្រើសរើស" value-key="value">
											<el-option v-for="item in gender" :key="item" :value-key="item"
												:label="item.gender_name_kh" :value="item.gender_id">

											</el-option>
										</el-select>
									</el-form-item>
								</div>

								<div>
									<el-form-item label="ថ្ងៃ/ខែ/ឆ្នាំកំណើត" prop="dobValue" class="sanfont-khmer"
										:label-width="formLabelWidth" name="date_of_birth">
										<el-date-picker v-model="ruleForm.dobValue" type="date" name="date_of_birth">
										</el-date-picker>
									</el-form-item>
								</div>
								<div>
									<el-form-item label="ទីកន្លែងកំណើត" prop="birthAddress" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-input v-model="ruleForm.birthAddress" autocomplete="off" name="place_of_birth"
											clearable />
									</el-form-item>
								</div>

								<div>
									<el-form-item label="អាសយដ្ឋានបច្ចុប្បន្ន" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-input v-model="ruleForm.address" autocomplete="off" name="address" clearable />
									</el-form-item>
								</div>

							</div>
							<div class="flex flex-col space-y-1">
								<div>
									<el-form-item label="រូបភាព" class="sanfont-khmer" :label-width="formLabelWidth">
										<div>
											<el-upload class="avatar-uploader" action="#" name="file" :show-file-list="true"
												:auto-upload="false" :on-change="handleAvatarSuccess"
												:before-upload="beforeAvatarUpload">
												<img v-if="imageUrl" :src="imageUrl" class="avatar 	object-contain ">
												<i v-else class="el-icon-plus avatar-uploader-icon"></i>
											</el-upload>
											<input type="hidden" name="file_upload_id" v-model="ruleForm.file_upload_id">
										</div>
									</el-form-item>
								</div>

								<div>
									<el-form-item label="លេខទូរស័ព្ទ" class="sanfont-khmer" :label-width="formLabelWidth">
										<el-input v-model="ruleForm.phoneNum" autocomplete="off" type="number" name="phone"
											clearable />
									</el-form-item>
								</div>
								<div>
									<el-form-item label="សារអេឡិចត្រូនិច" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-input v-model="ruleForm.email" autocomplete="off" name="email" clearable />
									</el-form-item>
								</div>

								<div>
									<el-form-item label="ស្ថានភាព" prop="status" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-select v-model="ruleForm.statusValue" placeholder="ជ្រើសរើស">
											<el-option v-for="item in status" :key="item" :label="item.status_kh"
												:value="item.status_id">
											</el-option>
										</el-select>
									</el-form-item>
								</div>
								<div>
									<el-form-item label="ផ្សេងៗ" prop="studentOtherText" class="sanfont-khmer"
										:label-width="formLabelWidth">
										<el-input type="textarea" :rows="5" v-model="ruleForm.studentOtherText"
											name="other">
										</el-input>
									</el-form-item>
								</div>
							</div>
						</div>
					</div>

				</el-tab-pane>
				<el-tab-pane label="ព័ត៌មានមធ្យមសិក្សាបឋមភូមិ">
					<div class="flex flex-col xl:flex-row">
						<div class="flex flex-col space-y-1">
							<div>

								<el-form-item label="អនុវិទ្យាល័យ" prop="from_secondary_high_school" class="sanfont-khmer "
									:label-width="formLabelWidth">
									<el-input v-model="ruleForm.from_secondary_high_school"
										name="from_secondary_high_school" clearable></el-input>
								</el-form-item>
							</div>
							<div>

								<el-form-item label="សម័យប្រលង" prop="secondary_exam_date" class="sanfont-khmer "
									:label-width="formLabelWidth">
									<el-input v-model="ruleForm.secondary_exam_date" name="secondary_exam_date"
										clearable></el-input>
								</el-form-item>
							</div>
							<div>

								<el-form-item label="ទីកន្លែងប្រលង" prop="secondary_exam_place" class="sanfont-khmer "
									:label-width="formLabelWidth">
									<el-input v-model="ruleForm.secondary_exam_place" name="secondary_exam_place"
										clearable></el-input>
								</el-form-item>
							</div>

						</div>
						<div class="flex flex-col space-y-1">

							<div>

								<el-form-item label="បន្ទប់ប្រលង" prop="secondary_exam_room" class="sanfont-khmer "
									:label-width="formLabelWidth">
									<el-input v-model="ruleForm.secondary_exam_room" name="secondary_exam_room"
										clearable></el-input>
								</el-form-item>
							</div>
							<div>

								<el-form-item label="លេខតុ" prop="secondary_exam_desk" class="sanfont-khmer "
									:label-width="formLabelWidth">
									<el-input v-model="ruleForm.secondary_exam_desk" name="secondary_exam_desk"
										clearable></el-input>
								</el-form-item>
							</div>
						</div>
					</div>
				</el-tab-pane>
			</el-tabs>

		</el-form>
		<el-dialog v-model="dialogVisible">
			<img w-full :src="dialogImageUrl" alt="Preview Image" />
		</el-dialog>
		<template #footer>
			<span class="dialog-footer">
				<el-button @click="cancelAction()" class="sanfont-khmer " type="danger"> បោះបង់</el-button>
				<el-button v-if="!isShowButtonUpdate" type="primary" class="sanfont-khmer" @click="submitForm('ruleForm')">
					រក្សាទុក
				</el-button>
				<el-button v-if="isShowButtonUpdate" type="primary" class="sanfont-khmer" @click="updateData('ruleForm')">
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
				birthAddress: null,
				phoneNum: null,
				studentOtherText: null,
				statusValue: null,
				IDn: null,
				from_secondary_high_school: null,
				secondary_exam_date: null,
				secondary_exam_place: null,
				secondary_exam_room: null,
				secondary_exam_desk: null,
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
				fullNameEng: [
					{ required: true, message: 'សូមបញ្ជូលនាមពេញ (អង់គ្លេស)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				fullNameKh: [
					{ required: true, message: 'សូមបញ្ជូលនាមពេញ (ខ្មែរ)', trigger: 'blur' },
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

				birthAddress: [
					{ required: true, message: 'សូមបញ្ជូលអាសយដ្ឋាន', trigger: 'blur' },

				],
				phoneNum: [
					{ required: true, message: 'សូមបញ្ជូលលេខទូរស័ព្ទ', trigger: 'blur' },
					{ min: 8, message: 'យ៉ាងតិចឲបាន៨តួ', trigger: 'blur' },

				],

			},
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
			loading: false,

			//Data Page filter
			page: 1,
			per_page: 10,
			sort_by: 'sid',
			order_by: 1,
			search: '',
			tSearch: null,
			is_show_trust: 0,
			//Data Page filter
			status: [],
			gender: []
		}
	},
	mounted() {
		this.getData()
	},
	methods: {
		async getData() {
			this.loading = true
			await axios.get(`/student/get?page=${this.page}&per_page=${this.per_page}&sort_by=${this.sort_by}&order_by=${this.order_by}&search=${this.search}&is_show_trust=${this.is_show_trust}`)
				.then(response => {
					this.tableData = response.data.data
					this.classData = response.data.class
					this.status = response.data.status
					this.gender = response.data.gender
					this.loading = false
				}).catch((error) => {
					if (error.response.status == 401) {
						this.$store.commit("auth/CLEAR_TOKEN")
					}
				})
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
				this.ruleForm.file_upload_id = response.data.file.id
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
			form.append('status_id', this.ruleForm.statusValue)
			form.append('gender_id', this.ruleForm.genderValue)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/student/create', form, config).then(response => {
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
			form.append('status_id', this.ruleForm.statusValue)
			form.append('gender_id', this.ruleForm.genderValue)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/student' + '/update/' + this.ruleForm.student_id, form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
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
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async restoreData(id) {
			await axios.post('/student' + '/restore/' + id).then(response => {
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

		async addStudent() {
			this.ruleForm.student_id = null;
			this.ruleForm.firstNameKh = null;
			this.ruleForm.LastNameKh = null;
			this.ruleForm.fullNameKh = null;
			this.ruleForm.firstNameEng = null;
			this.ruleForm.LastNameEng = null;
			this.ruleForm.fullNameEng = null;
			this.ruleForm.roles = null;
			this.ruleForm.password = null;
			this.ruleForm.email = null;
			this.ruleForm.file_upload_id = null;
			this.ruleForm.student_id = null;
			this.ruleForm.genderValue = null;
			this.ruleForm.dobValue = null;
			this.ruleForm.address = null;
			this.ruleForm.birthAddress = null;
			this.ruleForm.phoneNum = null;
			this.ruleForm.studentOtherText = null;
			this.ruleForm.statusValue = null;
			this.ruleForm.IDn = null;
			this.ruleForm.from_secondary_high_school = null;
			this.ruleForm.secondary_exam_date = null;
			this.ruleForm.secondary_exam_place = null;
			this.ruleForm.secondary_exam_room = null;
			this.ruleForm.secondary_exam_desk = null;

			this.imageUrl = ''
			this.ruleForm.photo_id = ''
			this.roles = null

			this.dialogFormVisible = true
			this.isShowButtonUpdate = false;

		},

		async editStudent(id) {
			this.dialogFormVisible = true;
			this.isShowButtonUpdate = true;
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
				this.ruleForm.birthAddress = response.data.data.place_of_birth
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
				this.ruleForm.from_secondary_high_school = response.data.data.from_secondary_high_school;
				this.ruleForm.secondary_exam_date = response.data.data.secondary_exam_date;
				this.ruleForm.secondary_exam_place = response.data.data.secondary_exam_place;
				this.ruleForm.secondary_exam_room = response.data.data.secondary_exam_room;
				this.ruleForm.secondary_exam_desk = response.data.data.secondary_exam_desk;

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
		async exportExcel() {
			axios.post('/student/exportExcel', {
				file_name: 'Teacher',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'teacher');
			});
		},
		async exportPDF() {
			axios.post('/student/exportPDF', {
				file_name: 'Student',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'student');
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
</style>