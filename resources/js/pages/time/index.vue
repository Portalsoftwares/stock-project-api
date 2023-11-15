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
					@click="AddTime"
					:disabled="permission_create"
				>
					<el-icon>
						<CirclePlusFilled />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> បន្ថែម</span>
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
					<el-table-column
						width="250"
						label="ម៉ោងសិក្សា"
					>
						<template #default="scope">{{ scope.row.name }}</template>
					</el-table-column>
					<el-table-column
						property="first_name_en"
						label="ម៉ោងចាប់ផ្ដើម"
						width="320"
					>
						<template #default="scope">{{scope.row.start_date  }}</template>

					</el-table-column>
					<el-table-column
						property="first_name_en"
						label="ម៉ោងបញ្ចប់"
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
									@click="restoreData(scope.row.time_id)"
								>ស្ដារឡើងវិញ</el-button>
								<el-popconfirm
									width="220"
									confirm-button-text="យល់ព្រម"
									cancel-button-text="ទេ"
									:icon="InfoFilled"
									icon-color="#626AEF"
									title="តើអ្នកពិតជាចង់លុបមែនទេ?"
									cancel-button-type="info"
									@confirm="handleDelete(scope.row.time_id)"
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
									@click="editTime(scope.row.time_id)"
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
									@confirm="handleDelete(scope.row.time_id)"
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
		title="ព័ត៌មានម៉ោង"
		class="sanfont-khmer "
		width="35%"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានម៉ោង</h4>
			</div>
		</template>
		<el-form
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
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ម៉ោងចាប់ផ្ដើម"
								prop="start_date"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<input
									type="hidden"
									:value="ruleForm.start_date"
									name="start_date"
								>
								<el-time-select
									v-model="ruleForm.start_date"
									start="00:00"
									step="00:10"
									end="23:59"
									placeholder="ជ្រើសរើសម៉ោង"
									format="hh:mm A"
								/>

							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ម៉ោងបញ្ចប់"
								prop="end_date"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<input
									type="hidden"
									:value="ruleForm.end_date"
									name="end_date"
								>
								<el-time-select
									v-model="ruleForm.end_date"
									start="00:00"
									step="00:10"
									end="23:59"
									placeholder="ជ្រើសរើសម៉ោង"
									format="hh:mm A"
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
	<!-- Dialog user  -->
</template>
<script>
import { fnpermissions } from '../../permissions'
import FileSaver from 'file-saver'

export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			//Check permission
			permission_view: !fnpermissions.can('time-view'),
			permission_create: !fnpermissions.can('time-create'),
			permission_edit: !fnpermissions.can('time-edit'),
			permission_delete: !fnpermissions.can('time-delete'),

			tableData: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			roles: [],
			name: "",
			formLabelWidth: "135px",
			dialogImageUrl: "",
			dialogVisible: false,
			files: {},
			form: {},
			imageUrl: '',
			isShowPassword: true,
			isShowButtonUpdate: false,

			ruleForm: {
				time_id: null,
				name: null,
				start_date: '',
				end_date: '',
			},
			rules: {
				name: [
					{ required: true, message: 'សូមបញ្ជូលឈ្មោះ', trigger: 'blur' },
				],
				start_date: [
					{ required: true, message: 'សូមបញ្ជូលម៉ោងចាប់ផ្ដើម', trigger: 'blur' }
				],
				end_date: [
					{ required: true, message: 'សូមបញ្ជូលម៉ោងបញ្ចប់', trigger: 'blur' }
				],

			},

			loading: false,
			//Data Page filter
			page: 1,
			per_page: 20,
			sort_by: 'time_id',
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

		},
		resetForm(formName) {
			if (this.$refs[formName]) {
				this.$refs[formName].resetFields();
			}
		},
		/*
		*  Function create new user  
		*/
		async submitData() {
			const form = new FormData(document.getElementById('fm'));
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/time/create', form, config).then(response => {
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
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/time/update/' + this.ruleForm.time_id, form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async AddTime() {
			this.ruleForm.name = null
			this.ruleForm.start_date = ''
			this.ruleForm.end_date = ''
			this.ruleForm.time_id = null
			this.dialogFormVisible = true
			this.isShowButtonUpdate = false;
		},
		async getData() {
			this.loading = true
			await axios.get(`/time/get?page=${this.page}&per_page=${this.per_page}&sort_by=${this.sort_by}&order_by=${this.order_by}&search=${this.search}&is_show_trust=${this.is_show_trust}`).then(response => {
				this.tableData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async editTime(id) {
			this.dialogFormVisible = true;
			this.isShowButtonUpdate = true;
			await axios.get('/time/edit/' + id).then(response => {
				this.ruleForm.time_id = response.data.data.time_id
				this.ruleForm.name = response.data.data.name
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

			await axios.delete('/time/delete/' + id).then(response => {
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
			await axios.post('/time/restore/' + id).then(response => {
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
			axios.post('/time/exportExcel', {
				file_name: 'time',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'time');
			});
		},

		async exportPDF() {
			axios.post('/time/exportPDF', {
				file_name: 'time',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'time');
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