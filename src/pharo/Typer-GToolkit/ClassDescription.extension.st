Extension { #name : #ClassDescription }

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCoverageFor: aView context: aDictionary [
	<gtClassView>
	^ aView explicit
		title: 'Coverage';
		priority: 50;
		stencil: [ BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChildren:
					{(BrLabel new
						aptitude: BrGlamorousLabelLook;
						text: 'methods';
						yourself).
					self typGtMethodCoverage typGtAsCoverageElement.
					(BrLabel new
						aptitude: BrGlamorousLabelLook;
						text: 'nodes';
						yourself).
					self typGtNodeCoverage typGtAsCoverageElement};
				yourself ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtMethodCoverage [
	^ ((self methods , self classSide methods collect: #ast)
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtMethodsElementInPackage: aPackage [

	| methods width |
	methods := aPackage methodsForClass: self.
	width := methods size sqrt ceiling.
	^ BlElement new
		  layout: (BlGridLayout new
				   rowCount: width;
				   columnCount: width;
				   cellSpacing: 5;
				   yourself);
		  constraintsDo: [ :c | 
			  c horizontal fitContent.
			  c vertical fitContent ];
		  border:
		  (BlBorder
			   paint: BrGlamorousColors defaultButtonBorderColor
			   width: 1);
		  aptitude: (BrGlamorousWithTooltipAptitude content: [ 
				   BrLabel new
					   look: BrGlamorousLabelAptitude;
					   padding: (BlInsets all: 5);
					   text: self name;
					   yourself ]);
		  addChildren: (methods collect: #typGtElement);
		  yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtNodeCoverage [
	^ ((self methods , self classSide methods
		flatCollect: [ :e | e ast allChildren , {e ast} ])
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariableElementFor: aSymbol [

	| type |
	type := self typAsType lookupVariable: aSymbol.
	^ BlElement new
		  background: (type isUnknown
				   ifTrue: [ Color blue ]
				   ifFalse: [ Color green ]);
		  constraintsDo: [ :c | 
			  c horizontal exact: 16. "typCastAs BlLayoutCommonConstraintsAxis"
			  c vertical exact: 16 "typCastAs BlLayoutCommonConstraintsAxis" ];
		  aptitude: (BrGlamorousWithTooltipAptitude content: [ 
					   BrLabel new
						   look: BrGlamorousLabelAptitude;
						   padding: (BlInsets all: 5);
						   text: aSymbol;
						   yourself ]);
		  when: BlClickEvent do: [ :f | f target phlow spawnObject: type ];
		  yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariableNames [
	^ self instVarNames
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariablesElementInPackage: aPackage [

	| variables width |
	variables := (aPackage includesClass: self instanceSide)
		             ifTrue: [ self typGtVariableNames ]
		             ifFalse: [ #(  ) ].
	width := variables size sqrt ceiling.
	^ BlElement new
		  layout: (BlGridLayout new
				   rowCount: width;
				   columnCount: width;
				   cellSpacing: 5;
				   yourself);
		  constraintsDo: [ :c | 
			  c horizontal fitContent.
			  c vertical fitContent ];
		  border:
		  (BlBorder
			   paint: BrGlamorousColors defaultButtonBorderColor
			   width: 1);
		  aptitude: (BrGlamorousWithTooltipAptitude content: [ 
				   BrLabel new
					   look: BrGlamorousLabelAptitude;
					   padding: (BlInsets all: 5);
					   text: self name;
					   yourself ]);
		  addChildren:
		  (variables collect: [ :e | self typGtVariableElementFor: e ]);
		  yourself
]
