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
		</div>
		<div class="flex flex-col xl:flex-row">
			<div class="self-center">
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
			<div class="self-center">
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
					@click="AddAcademic"
					:disabled="permission_create"
				>
					<el-icon>
						<CirclePlusFilled />
					</el-icon>
					<span class="mx-1 sanfont-khmer" > បន្ថែម</span>
				</el-button>
			</div>
		</div>
	</div>
	<div class="grid grid-cols-1 gap-2 ">
		<div class=" border rounded bg-gray-50">
			<div class="flex flex-col  ">
				<el-table
					:data="tableData.data"
					height="770"
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
					<el-table-column label="ឆ្នាំសិក្សា">
						<template #default="scope">{{ scope.row.academic_name }}</template>
					</el-table-column>
					<el-table-column
						property="first_name_en"
						label="​ថ្ងៃចាប់ផ្ដើម"
						width="320"
					>
						<template #default="scope">{{scope.row.start_date  }}</template>

					</el-table-column>
					<el-table-column
						property="first_name_en"
						label="​ថ្ងៃបញ្ចប់"
						width="320"
					>
						<template #default="scope">{{scope.row.end_date  }}</template>

					</el-table-column>

					<el-table-column
						fixed="right"
						align="center"
						label="សកម្មភាព"
						min-width="180"
					>
						<template #default="scope">
							<div v-if="is_show_trust==1 &&!loading">
								<el-button
									size="small"
									class="sanfont-khmer"
									@click="restoreData(scope.row.academic_id)"
								>ស្ដារឡើងវិញ</el-button>
								<el-popconfirm
									width="220"
									confirm-button-text="យល់ព្រម"
									cancel-button-text="ទេ"
									:icon="InfoFilled"
									icon-color="#626AEF"
									title="តើអ្នកពិតជាចង់លុបមែនទេ?"
									cancel-button-type="info"
									@confirm="handleDelete(scope.row.academic_id)"
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
									@click="editAcademic(scope.row.academic_id)"
									:disabled="permission_edit"
								>កែប្រែ</el-button>
								<el-popconfirm
									width="220"
									confirm-button-text="យល់ព្រម"
									cancel-button-text="ទេ"
									:icon="InfoFilled"
									icon-color="#626AEF"
									title="តើអ្នកពិតជាចង់លុបមែនទេ?"
									cancel-button-type="info"
									@confirm="handleDelete(scope.row.academic_id)"
								>
									<template #reference>
										<el-button
											size="small"
											type="danger"
											class="sanfont-khmer"
											:disabled="permission_delete"
										>លុប
										</el-button>
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
		title="ព័ត៌មានឆ្នាំសិក្សា"
		class="sanfont-khmer "
		width="27%"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានឆ្នាំសិក្សា</h4>
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
								prop="academic_name"
								class="sanfont-khmer "
								:label-width="formLabelWidth"
								:error="errors?.academic_name"
							>
								<el-input
									v-model="ruleForm.academic_name"
									name="academic_name"
									style="width: 220px;"
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="​ថ្ងៃចាប់ផ្ដើម"
								prop="start_date"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-date-picker
									v-model="ruleForm.start_date"
									type="date"
									name="start_date"
									:size="size"
								/>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ថ្ងៃបញ្ចប់"
								prop="end_date"
								class="sanfont-khmer w-full"
								:label-width="formLabelWidth"
							>
								<el-date-picker
									v-model="ruleForm.end_date"
									type="date"
									name="end_date"
									:size="size"
								/>
							</el-form-item>
						</div>
					</div>

				</div>
			</div>

		</el-form>
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
	<!-- Dialog academic  -->
</template>
<script>
import { fnpermissions } from '../../permissions'
import FileSaver from 'file-saver'

export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			//Check permission
			permission_view: !fnpermissions.can('academic-view'),
			permission_create: !fnpermissions.can('academic-create'),
			permission_edit: !fnpermissions.can('academic-edit'),
			permission_delete: !fnpermissions.can('academic-delete'),

			tableData: [],
			dialogFormVisible: false,
			formLabelWidth: "105px",
			isShowButtonUpdate: false,

			ruleForm: {
				academic_id: null,
				academic_name: null,
				start_date: '',
				end_date: '',
			},
			rules: {
				academic_name: [
					{ required: true, message: 'សូមបញ្ជូលឈ្មោះ', trigger: 'blur' },
				],
				start_date: [
					{ required: true, message: 'សូមបញ្ជូលកាលបរិច្ជេទចាប់ផ្ដើម', trigger: 'blur' }
				],
				end_date: [
					{ required: true, message: 'សូមបញ្ជូលកាលបរិច្ជេទបញ្ចប់', trigger: 'blur' }
				],

			},

			loading: false,
			//Data Page filter
			page: 1,
			per_page: 10,
			sort_by: 'academic_id',
			order_by: 1,
			search: '',
			tSearch: null,
			is_show_trust: 0,
			//Data Page filter
		}
	},
	mounted() {
		// this.getData()
	},
	methods: {
		async getData() {
			this.loading = true
			await axios.get(`/academic/get?page=${this.page}&per_page=${this.per_page}&sort_by=${this.sort_by}&order_by=${this.order_by}&search=${this.search}&is_show_trust=${this.is_show_trust}`).then(response => {
				this.tableData = response.data.data
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
		//This can init loading data bcoz function call as change on switch input 😂
		clickShowwTrush() {
			this.getData();
		},
		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.submitData()
				
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		cancelAction() {
			this.resetForm('ruleForm');
			this.dialogFormVisible = !this.dialogFormVisible;

		},
		resetForm(formName) {
			if (this.$refs[formName]) {
				this.$refs[formName].resetFields();
			}
		},

		/*
		*  Function create new academic  
		*/
		async submitData() {
			const form = new FormData(document.getElementById('fm'));
			form.append('role', this.ruleForm.roles)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/academic/create', form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.resetForm('ruleForm')
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			}).catch((error) => {
				if (error.response.status == 400) {
					this.errors = error.response.data.errors;
					console.log(this.errors )
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកមិនទទួលបានជោគជ័យទេ',
						type: 'error'
					});
				}
			})
		},
		/*
	*  Function update new academic  
	*/
		async updateData() {

			const form = new FormData(document.getElementById('fm'));
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/academic/update/' + this.ruleForm.academic_id, form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},


		async AddAcademic() {
			this.ruleForm.academic_id = null
			this.ruleForm.academic_name = null
			this.ruleForm.start_date = null
			this.ruleForm.end_date = null

			this.isShowButtonUpdate = false;
			this.dialogFormVisible = true

		},

		async editAcademic(id) {
			this.dialogFormVisible = true;
			this.isShowButtonUpdate = true;
			await axios.get('/academic/edit/' + id).then(response => {
				this.ruleForm.academic_id = response.data.data.academic_id
				this.ruleForm.academic_name = response.data.data.academic_name
				this.ruleForm.start_date = response.data.data.start_date
				this.ruleForm.end_date = response.data.data.end_date

				this.dialogFormVisible = true;
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async handleDelete(id) {

			await axios.delete('/academic/delete/' + id).then(response => {
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
				this.getData();
			}).catch(error=>{
				if(error.response.status==400){
					this.$message({
						message: error.response.data.data,
						type: 'error'
					});
				}
			})
		},
		async restoreData(id) {
			await axios.post('/academic/restore/' + id).then(response => {
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
				this.getData();
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async exportExcel() {
			axios.post('/academic/exportExcel', {
				file_name: 'academic',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'academic');
			});
		},

		async exportPDF() {
			axios.post('/academic/exportPDF', {
				file_name: 'academic',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'academic');
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