<template>
	<div class="bg-white p-2 w-full border justify-between rounded-t xl:flex xl:flex-row">
		<div class="flex  flex-col space-y-2 ">

			<div class="flex space-x-2">
				<div class="self-center pr-2">
					<el-select
						v-model="filter_academic_id"
						filterable
						clearable
						placeholder="ឆ្នាំសិក្សា"
					>
						<el-option
							v-for="item in academic"
							:key="item.id"
							:label="item.academic_name"
							:value="item.academic_id"
						>
						</el-option>
					</el-select>
				</div>
			</div>
			<div class="flex space-y-2  2xl:space-y-0 ">
				<div class="self-center  ">
					<el-select
						v-model="filter_class_type_id"
						filterable
						clearable
						multiple
						placeholder="ប្រភេទថ្នាក់"
						collapse-tags
						collapse-tags-tooltip
						:max-collapse-tags="2"
					>
						<el-option
							v-for="item in classType"
							:key="item.id"
							:label="item.name"
							:value="item.class_type_id"
						>
						</el-option>
					</el-select>
				</div>
				<div class="flex space-x-2 ">
					<div class="self-center pl-2">
						<el-select
							v-model="filter_grade_level_id"
							filterable
							clearable
							multiple
							placeholder="កម្រិត"
						>
							<el-option
								v-for="item in gradeLevel"
								:key="item"
								:label="item.grade_level_name"
								:value="item.grade_level_id"
							>
							</el-option>
						</el-select>
					</div>
					<div class="self-center">
						<el-button
							type="primary"
							@click="filterAction"
						>
							<el-icon>
								<Search />
							</el-icon>
						</el-button>
					</div>
				</div>
			</div>
		</div>
		<div class="flex flex-col space-x-2 space-y-2 ">
			<div class=" self-end">
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
				<el-button type="info" @click="exportExcel">
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
				<el-button
					type="primary"
					@click="AddClass"
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

				<div>
					<el-table
						v-loading="loading_class"
						:data="tableData.data"
						height="730"
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
							align="center"
							label="សកម្មភាព"
							width="230"
						>
							<template #default="scope">
								<div v-if="is_show_trust==1 &&!loading">
									<el-button
										size="small"
										class="sanfont-khmer"
										@click="restoreData(scope.row.class_id)"
									>ស្ដារឡើងវិញ</el-button>
									<el-popconfirm
										width="220"
										confirm-button-text="យល់ព្រម"
										cancel-button-text="ទេ"
										:icon="InfoFilled"
										icon-color="#626AEF"
										title="តើអ្នកពិតជាចង់លុបមែនទេ?"
										cancel-button-type="info"
										@confirm="handleDelete(scope.row.class_id)"
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
										@click="editClass(scope.row.class_id)"
									>កែប្រែ</el-button>
									<el-popconfirm
										width="220"
										confirm-button-text="យល់ព្រម"
										cancel-button-text="ទេ"
										:icon="InfoFilled"
										icon-color="#626AEF"
										title="តើអ្នកពិតជាចង់លុបមែនទេ?"
										cancel-button-type="info"
										@confirm="handleDelete(scope.row.class_id)"
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
							</template>
						</el-table-column>
						<el-empty description="description"></el-empty>
					</el-table>
				</div>
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
		title="ព័ត៌មានថ្នាក់រៀន"
		class="sanfont-khmer"
		width="33%"
		align-center="true"
		draggable
	>

		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានថ្នាក់រៀន</h4>
			</div>
		</template>
		<el-form
			class="grid grid-cols-1"
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
					:error="errors?.class_name"
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
							:label="data.academic_name"
							:value="data.academic_id"
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
						placeholder="ជ្រើសរើស"
						class="text-left "
						v-model="ruleForm.grade_level_id"
					>
						<el-option
							v-for="data in gradeLevel"
							:key="data"
							:label="data.grade_level_name"
							:value="data.grade_level_id"
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
							:value="data.class_type_id"
							:disabled="item?.disabled"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="ផ្សេងៗ"
					prop="other"
					class="sanfont-khmer pr-4"
					:label-width="formLabelWidth"
				>
					<el-input
						style="width: 300px;"
						type="textarea"
						:rows="5"
						v-model="ruleForm.other"
						name="other"
					>
					</el-input>
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
import FileSaver from 'file-saver'

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
				class_symbol: null,
				other: null,
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
			academic: [],
			gradeLevel: [],
			classType: [],
			nameSimble: [
				{
					name: 'A',
					id: 1
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
				{
					name: 'F',
					id: 6
				},
				{
					name: 'G',
					id: 7
				},
				{
					name: 'H',
					id: 8
				},
				{
					name: 'I',
					id: 9
				},
				{
					name: 'J',
					id: 10
				},
				{
					name: 'K',
					id: 11
				},
				{
					name: 'L',
					id: 12
				},
				{
					name: 'M',
					id: 13
				},
				{
					name: 'N',
					id: 14
				},
				{
					name: 'O',
					id: 15
				},
				{
					name: 'P',
					id: 16
				},
				{
					name: 'Q',
					id: 17
				},
				{
					name: 'R',
					id: 18
				},
				{
					name: 'S',
					id: 19
				},
				{
					name: 'T',
					id: 20
				},
				{
					name: 'U',
					id: 21
				},
				{
					name: 'V',
					id: 22
				},
				{
					name: 'W',
					id: 23
				},
				{
					name: 'X',
					id: 24
				},
				{
					name: 'Y',
					id: 25
				},
				{
					name: 'Z',
					id: 26
				},
			],
			gradeLevelId: null,
			nameClass: '',
			//Data Page filter
			page: 1,
			per_page: 10,
			sort_by: 'class_id',
			order_by: 1,
			search: '',
			tSearch: null,
			is_show_trust: 0,
			//Data Page filter,
			errors: '',

			filter_academic_id: '',
			filter_class_type_id: '',
			filter_grade_level_id: '',
		}
	},
	watch: {
		'ruleForm.grade_level_id': function (event) {
			var obj = this.gradeLevel.find(e => e.grade_level_id == this.ruleForm.grade_level_id);
			this.ruleForm.class_name = (obj?.grade_level_name ?? '') + " " + (this.ruleForm.class_symbol ?? '');
		}
	},
	mounted() {
		// this.getData()
	},
	methods: {
		filterAction() {
			this.getData()
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
		},
		getNameClass() {
			var obj = this.gradeLevel.find(e => e.grade_level_id == this.ruleForm.grade_level_id);
			console.log(obj)
			this.ruleForm.class_name = (obj.grade_level_name ?? '') + " " + (this.ruleForm.class_symbol ?? '');
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
		/*
		*  Function create new user  
		*/
		async submitData() {
			const data = {
				'class_name': this.ruleForm.class_name,
				'class_type_id': this.ruleForm.class_type_id,
				'grade_level_id': this.ruleForm.grade_level_id,
				'academic_id': this.ruleForm.academic_id,
				'other': this.ruleForm.other,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}

			await axios.post('/class/create', data, config).then(response => {
				this.dialogFormVisible = false;
				this.$notify.success({
					title: 'ព័ត៌មាន',
					message: 'បញ្ចូលបានជោគជ័យ 😊',
					showClose: true
				});
				this.getData();
			}).catch((error) => {
				if (error.response.status == 400) {
					this.errors = error.response.data.errors;
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកមិនទទួលបានជោគជ័យទេ',
						type: 'error'
					});
				}
			})
		},
		/*
	*  Function update new user  
	*/
		async updateData() {
			const data = {
				'class_name': this.ruleForm.class_name,
				'class_type_id': this.ruleForm.class_type_id,
				'grade_level_id': this.ruleForm.grade_level_id,
				'academic_id': this.ruleForm.academic_id,
				'other': this.ruleForm.other,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/class/update/' + this.ruleForm.class_id, data, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			}).catch((error) => {
				if (error.response.status == 400) {
					this.errors = error.response.data.errors;
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកមិនទទួលបានជោគជ័យទេ',
						type: 'error'
					});
				}
			})
		},

		async AddClass() {
			this.ruleForm.class_id = null;
			this.ruleForm.class_name = null;
			this.ruleForm.class_type_id = null;
			this.ruleForm.grade_level_id = null;
			this.gradeLevelId = null;
			this.ruleForm.academic_id = null;

			this.dialogFormVisible = true
			this.isShowButtonUpdate = false;
		},
		async getData() {
			this.loading_class = true;
			await axios.get(`/class/get?page=${this.page}&per_page=${this.per_page}&sort_by=${this.sort_by}&order_by=${this.order_by}&search=${this.search}&is_show_trust=${this.is_show_trust}
             &academic=${this.filter_academic_id}&grade_level=${this.filter_grade_level_id}&class_type=${this.filter_class_type_id}
			`).then(response => {
				this.tableData = response.data.data
				this.academic = response.data.academic
				this.gradeLevel = response.data.grade_level
				this.classType = response.data.class_type
				this.loading_class = false;
			}).catch((error) => {
				this.loading_class = false;
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async editClass(id) {
			this.isShowButtonUpdate = true;
			this.isShowPassword = false;

			await axios.get('/class/edit/' + id).then(response => {
				this.ruleForm.class_id = response.data.data.class_id;
				this.ruleForm.class_name = response.data.data.class_name;
				this.ruleForm.class_type_id = response.data.data.class_type_id;
				this.ruleForm.grade_level_id = response.data.data.grade_level_id;
				this.ruleForm.academic_id = response.data.data.academic_id;
				let symbol = '';
				if (response.data.data.class_name != null) {
					const arraySymbol = response.data.data.class_name.split(' ');
					symbol = arraySymbol[1];
				}
				this.ruleForm.class_symbol = symbol;
				this.ruleForm.other = response.data.data.other;

				this.dialogFormVisible = true;
			}).catch((error) => {
				if (error.response?.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async handleDelete($id) {
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.delete('/class/delete/' + $id, config).then(response => {
				this.getData();
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
		},
		async restoreData(id) {
			await axios.post('/class/restore/' + id).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async exportExcel() {
			axios.post('/class/exportExcel', {
				file_name: 'class',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'class');
			});
		},

		async exportPDF() {
			axios.post('/class/exportPDF', {
				file_name: 'class',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'class');
			});
		},
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