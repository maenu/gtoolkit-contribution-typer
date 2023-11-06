Extension { #name : #ClassDescription }

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCheMethodsElementInPackage: aPackage [
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
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		aptitude: (BrGlamorousWithTooltipAptitude
				content: [ BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						padding: (BlInsets all: 5);
						text: self name;
						yourself ]);
		addChildren: (methods collect: #typGtCheElement);
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCovFor: aView context: aDictionary [
	<gtClassView>
	^ aView explicit
		title: 'Coverage';
		priority: 50;
		stencil: [ BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChildren: {BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							text: 'methods';
							yourself.
						self typGtCovMethod typGtCovAsElement.
						BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							text: 'nodes';
							yourself.
						self typGtCovNode typGtCovAsElement};
				yourself ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCovMethod [
	^ ((self methods , self classSide methods collect: #ast)
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCovNode [
	^ ((self methods , self classSide methods
		flatCollect: [ :e | e ast allChildren , {e ast} ])
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtShaMethod: aSymbol type: aType [
	self methods
		detect: [ :m | m typShaCanResolveMethodSelector: aSymbol ]
		ifFound: [ :m | ^ m ].
	^ self
		compiledMethodAt: (self
				compile: ('typShaMethod{1}: aLookup root: anotherLookup
	<typShaMethod: ''{2}''>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ''{3}'' typAsType
		arguments: \{{4}\}'
						format: {aSymbol typGtShaMethodSelector.
								aSymbol.
								aType result.
								' . '
									join: (aType arguments collect: [ :t | '''{1}'' typAsType' format: {t} ])})
				classified: '*Typer-Shadow-Uncategorized')
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtShaVariable: aSymbol type: aType [
	self methods
		detect: [ :m | m typShaCanResolveVariableSelector: aSymbol ]
		ifFound: [ :m | ^ m ].
	^ self
		compiledMethodAt: (self
				compile: ('typShaVariable{1}: aLookup root: anotherLookup
	<typShaVariable: ''{2}''>
	^ ''{3}'' typAsType'
						format: {aSymbol capitalized.
								aSymbol.
								aType})
				classified: '*Typer-Shadow-Uncategorized')
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariableElementFor: aSymbol [
	| type |
	type := self typAsType lookupVariable: aSymbol.
	^ BlElement new
		background: (type isUnknown ifTrue: [ Color blue ] ifFalse: [ Color green ]);
		constraintsDo: [ :c | 
			c horizontal exact: 16.	"typCastAs BlLayoutCommonConstraintsAxis"
			c vertical exact: 16	"typCastAs BlLayoutCommonConstraintsAxis" ];
		aptitude: (BrGlamorousWithTooltipAptitude
				content: [ BrLabel new
						aptitude: BrGlamorousLabelAptitude;
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
			ifFalse: [ #() ].
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
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		aptitude: (BrGlamorousWithTooltipAptitude
				content: [ BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						padding: (BlInsets all: 5);
						text: self name;
						yourself ]);
		addChildren: (variables collect: [ :e | self typGtVariableElementFor: e ]);
		yourself
]
