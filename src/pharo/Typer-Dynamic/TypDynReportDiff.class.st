Class {
	#name : #TypDynReportDiff,
	#superclass : #Object,
	#instVars : [
		'dynamic',
		'inference'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #'as yet unclassified' }
TypDynReportDiff class >> dynamic: aReport inference: anotherReport [

	^ self new
		  initializeDynamic: aReport inference: anotherReport;
		  yourself
]

{ #category : #initialization }
TypDynReportDiff >> initializeDynamic: aReport inference: anotherReport [

	dynamic := aReport.
	inference := anotherReport
]

{ #category : #accessing }
TypDynReportDiff >> merged [
	| result |
	result := OrderedCollection new.
	inference
		keysDo: [ :k | 
			| dyn inf |
			dyn := dynamic at: k ifAbsent: nil.
			inf := inference at: k ifAbsent: nil.
			(k isKindOf: Association)
				ifTrue: [ inf parameters keys
						do: [ :s | 
							result
								add: (TypDynReportMethodParameterItem new
										clazz: k key;
										name: k value;
										parameter: s;
										dyn: (dyn ifNotNil: [ dyn at: s ]);
										inf: (inf ifNotNil: [ inf at: s ]);
										yourself) ] ]
				ifFalse: [ result
						add: (TypDynReportVariableItem new
								clazz: k owningClass;
								name: k name;
								dyn: dyn;
								inf: inf;
								yourself) ] ].
	^ result
]

{ #category : #accessing }
TypDynReportDiff >> typGtColor: anObject [
	^ anObject isCollection
		ifTrue: [ Color black alpha: 0.05 ]
		ifFalse: [ anObject typGtColor ]
]

{ #category : #accessing }
TypDynReportDiff >> typGtMondrianElement: anObject [
	^ anObject isCollection
		ifTrue: [ BlElement new
				background: (self typGtColor: anObject);
				margin: (BlInsets all: 1);
				padding: (BlInsets all: 1);
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				yourself ]
		ifFalse: [ anObject typGtAsElement ]
]

{ #category : #accessing }
TypDynReportDiff >> typGtMondrianFlatFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Graph flat';
		priority: 1;
		painting: [ :m | 
			m nodes
				shape: [ :c | self typGtMondrianElement: c ];
				with: ((self merged
							sorted: [ :a :b | 
								| ca cb |
								ca := a typGtColor.
								cb := b typGtColor.
								ca hue = cb hue
									ifTrue: [ ca saturation = cb saturation
											ifTrue: [ a class name > b class name ]
											ifFalse: [ ca saturation > cb saturation ] ]
									ifFalse: [ ca hue < cb hue ] ]) groupedBy: #class)
					forEach: [ :c | 
						m nodes
							shape: [ :e | self typGtMondrianElement: e ];
							with: c.
						m layout grid cellSpacing: 0 ].
			m layout grid cellSpacing: 2 ]
]

{ #category : #accessing }
TypDynReportDiff >> typGtMondrianFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Graph';
		priority: 1;
		painting: [ :m | 
			| sort sorted root |
			sort := [ :a :b | 
				| ca cb |
				ca := self typGtColor: a.
				cb := self typGtColor: b.
				ca hue = cb hue
					ifTrue: [ ca saturation = cb saturation
							ifTrue: [ a class name > b class name ]
							ifFalse: [ ca saturation > cb saturation ] ]
					ifFalse: [ ca hue < cb hue ] ].
			sorted := [ :d | 
				d isDictionary
					ifTrue: [ ((d associations do: [ :e | e value: (sorted value: e value) ])
							sorted: [ :a :b | sort value: a value value: b value ])
							asOrderedDictionary ]
					ifFalse: [ d sorted: sort ] ].
			root := Dictionary new.
			self merged
				do: [ :e | 
					((e path
						inject: root
						into: [ :r :ee | r at: ee ifAbsentPut: [ Dictionary new ] ])
						at: e class
						ifAbsentPut: [ OrderedCollection new ]) add: e ].
			root := sorted value: root.
			m nodes
				shape: [ :package | self typGtMondrianElement: package value ];
				with: root associations
					forEach: [ :package | 
						m nodes
							shape: [ :category | self typGtMondrianElement: category value ];
							with: package value associations
								forEach: [ :category | 
									m nodes
										shape: [ :clazz | self typGtMondrianElement: clazz value ];
										with: category value associations
											forEach: [ :clazz | 
												m nodes
													shape: [ :e | 
														BlElement new
															layout: BlLinearLayout horizontal;
															constraintsDo: [ :c | 
																c vertical fitContent.
																c horizontal fitContent ];
															yourself ];
													with: {clazz value
																	at: true
																	at: TypDynReportVariableItem
																	ifAbsent: #().
																clazz value
																	at: false
																	at: TypDynReportVariableItem
																	ifAbsent: #().
																clazz value
																	at: true
																	at: TypDynReportMethodParameterItem
																	ifAbsent: #().
																clazz value
																	at: false
																	at: TypDynReportMethodParameterItem
																	ifAbsent: #()}
														forEach: [ :c | 
															m nodes
																shape: [ :e | e typGtAsElement ];
																with: c.
															m layout grid cellSpacing: 0 ].
												m layout grid
													cellSpacing: 1;
													columnCount: 2 ].
									m layout rectanglePack ].
						m layout rectanglePack ].
			m layout rectanglePack ]
]

{ #category : #accessing }
TypDynReportDiff >> typGtSummaryFor: aView context: aContext [
	<gtView>
	| merged whole |
	merged := self merged.
	whole := (merged groupedBy: #class) collect: #size.
	^ aView columnedTree
		title: 'Tree';
		priority: 51;
		items: [ GtTreeNode
				fromCollection: (((merged groupedBy: #rank) associations sorted: [ :a :b | a key < b key ])
						as: OrderedDictionary) ];
		children: [ :n | 
			(n value isCollection and: [ n value isString not ])
				ifTrue: [ GtTreeNode fromNode: n ]
				ifFalse: [ #() ] ];
		actionUpdateButtonTooltip: 'Update tree';
		column: 'Index'
			text: [ :n | 
				(n value isCollection
					ifTrue: [ n key gtDisplayText ]
					ifFalse: [ '{1} {2}/{3}'
							format: {n parent key gtDisplayText.
									n key asString.
									n parent value size asString} ]) asRopedText foreground: Color gray ]
			weight: 1;
		column: 'dyn'
			text: [ :n | 
				n value isCollection
					ifTrue: [ | partition v m |
						partition := (n value groupedBy: #class) collect: #size.
						v := partition at: TypDynReportVariableItem ifAbsent: [ 0 ].
						m := partition at: TypDynReportMethodParameterItem ifAbsent: [ 0 ].
						'{1}|{2}% variables, {3}|{4}% methods'
							format: {v.
									(100 * v / (whole at: TypDynReportVariableItem)) asInteger.
									m.
									(100 * m / (whole at: TypDynReportMethodParameterItem)) asInteger} ]
					ifFalse: [ n value dyn asString ] ]
			weight: 1;
		column: 'inf'
			text: [ :n | n value isCollection ifTrue: [ '' ] ifFalse: [ n value inf asString ] ]
			weight: 1;
		column: 'dynReduced'
			text: [ :n | 
				(n value isCollection or: [ n value dyn = n value dynReduced ])
					ifTrue: [ '' ]
					ifFalse: [ n value dynReduced asString ] ]
			weight: 1;
		column: 'infReduced'
			text: [ :n | 
				(n value isCollection or: [ n value inf = n value infReduced ])
					ifTrue: [ '' ]
					ifFalse: [ n value infReduced asString ] ]
			weight: 1;
		send: #value
]
