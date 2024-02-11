Class {
	#name : #TypDynReportDiff,
	#superclass : #Object,
	#instVars : [
		'dynamic',
		'inference',
		'items'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #'as yet unclassified' }
TypDynReportDiff class >> dynamic: aReport inference: anotherReport [

	^ self new
		  initializeDynamic: aReport inference: anotherReport;
		  yourself
]

{ #category : #accessing }
TypDynReportDiff >> compare: a with: b [
	| ca cb |
	ca := self typGtColor: a.
	cb := self typGtColor: b.
	^ ca hue = cb hue
		ifTrue: [ ca alpha = cb alpha
				ifTrue: [ a class name > b class name ]
				ifFalse: [ ca alpha > cb alpha ] ]
		ifFalse: [ ca hue < cb hue ]
]

{ #category : #initialization }
TypDynReportDiff >> initializeDynamic: aReport inference: anotherReport [
	dynamic := aReport.
	inference := anotherReport.
	items := OrderedCollection new.
	inference
		keysDo: [ :k | 
			| dyn inf |
			dyn := dynamic at: k ifAbsent: nil.
			inf := inference at: k ifAbsent: nil.
			(k isKindOf: Association)
				ifTrue: [ items
						add: (TypDynResult new
								clazz: k key;
								name: k value;
								dyn: (dyn ifNotNil: #result);
								inf: inf result;
								yourself).
					inf arguments
						withIndexDo: [ :t :i | 
							items
								add: (TypDynArgument new
										clazz: k key;
										name: k value;
										index: i;
										dyn: (dyn ifNotNil: [ dyn arguments at: i ]);
										inf: t;
										yourself) ] ]
				ifFalse: [ | item |
					item := TypDynVariable new
							clazz: k owningClass;
							name: k name;
							dyn: dyn;
							inf: inf;
							yourself.
					items add: item ] ]
]

{ #category : #accessing }
TypDynReportDiff >> sorted: aCollection [
	aCollection isDictionary
		ifTrue: [ ^ ((aCollection associations do: [ :e | e value: (self sorted: e value) ])
				sorted: [ :a :b | self compare: a value with: b value ]) asOrderedDictionary ].
	aCollection isCollection
		ifTrue: [ ^ aCollection sorted: [ :a :b | self compare: a with: b ] ].
	^ aCollection
]

{ #category : #accessing }
TypDynReportDiff >> text: e [
	^ (e isKindOf: RPackage)
		ifTrue: [ e name ]
		ifFalse: [ e isSymbol ifTrue: [ e asString ] ifFalse: [ e name ] ]
]

{ #category : #accessing }
TypDynReportDiff >> typGtColor: anObject [
	| colors |
	anObject isCollection ifFalse: [ ^ anObject typGtColor ].
	colors := (anObject isDictionary
			ifTrue: [ anObject typLeafs ]
			ifFalse: [ anObject ]) collect: #typGtColor.
	^ (Color
		h: (colors sum: [ :e | e hue / colors size ])
		s: (colors sum: [ :e | e saturation / colors size ])
		v: (colors sum: [ :e | e brightness / colors size ])
		alpha: (colors sum: [ :e | e alpha / colors size ]) * 0.7)
]

{ #category : #accessing }
TypDynReportDiff >> typGtMondrianElement: anObject [
	^ anObject isCollection
		ifTrue: [ BlElement new
				background: (self typGtColor: anObject);
				margin: (BlInsets all: 1);
				padding: (BlInsets all: 1);
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
			| index |
			index := Dictionary new.
			items do: [ :e | index typAt: (e path first: 3) add: e ].
			m nodes
				shape: [ :c | self typGtMondrianElement: c ];
				with: (self sorted: index typLeafs).
			m layout grid cellSpacing: 0 ]
]

{ #category : #accessing }
TypDynReportDiff >> typGtMondrianFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Graph';
		priority: 1;
		painting: [ :m | 
			| index |
			index := Dictionary new.
			items do: [ :e | index typAt: (e path first: 3) add: e ].
			self
				typGtMondrianKey: 'Bloc-Layout' asPackage
				dictionary: (self sorted: index)
				in: m ]
]

{ #category : #accessing }
TypDynReportDiff >> typGtMondrianKey: key dictionary: value in: aMondrian [
	aMondrian nodes
		shape: [ :e | 
			| element |
			element := BlElement new.
			element
				layout: BlLinearLayout vertical;
				margin: (BlInsets all: 2);
				background: (Color white alpha: 0.9);
				clipChildren: false;
				zIndex: 0;
				geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChild: (BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							text: ((self text: e) asRopedText fontSize: 5);
							yourself)
					as: #label;
				addChild: (BlElement new
							layout: BlLinearLayout vertical;
							constraintsDo: [ :c | 
								c horizontal fitContent.
								c vertical fitContent ];
							clipChildren: false;
							in: [ :ee | ee graph beChildrenContainer: #items ];
							yourself)
					as: #items;
				when: BlMouseEnterEvent do: [ element zIndex: 1 ];
				when: BlMouseLeaveEvent do: [ element zIndex: 0 ];
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				yourself ];
		with: value associations;
		forEach: [ :a | 
				self
					typGtMondrianKey: a key
					value: a value
					in: aMondrian ]
			in: #items.
	aMondrian layout rectanglePack
]

{ #category : #accessing }
TypDynReportDiff >> typGtMondrianKey: key value: value in: aMondrian [
	key isClass
		ifTrue: [ aMondrian nodes
				shape: [ :e | 
					e typGtAsElement
						when: BlMouseEnterEvent
							do: [ :event | 
								| elements i name |
								elements := (event target parent children
										select: [ :c | 
											c graph model
												ifNil: false
												ifNotNil: [ :m | e path last isInteger and: [ e path allButLast = m path allButLast ] ] ])
										sorted: [ :a :b | a graph model index < b graph model index ].
								elements ifEmpty: [ elements := {event target} ].
								i := elements detectIndex: [ :ee | ee == event target ].
								elements
									withIndexDo: [ :ee :ii | 
										| dyn inf |
										dyn := ee childNamed: #labelDyn.
										dyn
											visibility: BlVisibility visible;
											transformDo: [ :t | t translateBy: dyn bounds width negated @ -2 - dyn position ].
										inf := ee childNamed: #labelInf.
										inf
											visibility: BlVisibility visible;
											transformDo: [ :t | t translateBy: 5 @ -2 - inf position ].
										name := event target childNamed: #labelName.
										name
											visibility: BlVisibility hidden;
											transformDo: [ :t | t translateBy: -2 @ -2 - name position ].
										(ee childNamed: #icon)
											transformDo: [ :t | t scaleBy: (ee == event target ifTrue: [ 1.5 ] ifFalse: [ 1 ]) ].
										ee
											zIndex: 2;
											transformDo: [ :t | 
												t
													translateBy: event target position - ee position
															+ (0 @ ((ii - i) * (event target bounds height + 2))) ] ].
								name := event target childNamed: #labelName.
								name
									visibility: BlVisibility visible;
									transformDo: [ :t | 
										t
											translateBy: ((name bounds width - 5) / 2) negated
													@ (i negated * (event target bounds height + 2) - 2)
													- name position ].
								event target
									zIndex: 1;
									addAptitude: (event target userData at: #typDynAptitude ifAbsentPut: [ BrShadowAptitude new ]);
									background: (Color white alpha: 0.9);
									geometry: (TypGtRoundedRectangleGeometry
											cornerRadius: 2
											bounds: (elements
													inject: BlBounds new
													into: [ :r :ee | 
														{ee childNamed: #labelDyn.
															ee childNamed: #labelInf}
															, (ee == event target ifTrue: [ {ee childNamed: #labelName} ] ifFalse: [ #() ])
															do: [ :eee | 
																| bounds |
																bounds := ((eee bounds inParent: event target parent)
																		inChild: event target) bounds.
																r
																	encompass: bounds topLeft;
																	encompass: bounds bottomRight ].
														r ])) ];
						when: BlMouseLeaveEvent
							do: [ :event | 
								| elements i |
								elements := (event target parent children
										select: [ :c | 
											c graph model
												ifNil: false
												ifNotNil: [ :m | e path last isInteger and: [ e path allButLast = m path allButLast ] ] ])
										sorted: [ :a :b | a graph model index < b graph model index ].
								elements ifEmpty: [ elements := {event target} ].
								i := elements indexOf: e.
								elements
									withIndexDo: [ :ee :ii | 
										(ee childNamed: #labelDyn) visibility: BlVisibility hidden.
										(ee childNamed: #labelInf) visibility: BlVisibility hidden.
										(ee childNamed: #labelName) visibility: BlVisibility hidden.
										(ee childNamed: #icon) transformDo: [ :t | t scaleBy: 1 ].
										ee
											background: (Color white alpha: 0.9);
											geometry: BlRectangleGeometry new;
											zIndex: 0;
											transformDo: [ :t | t translateBy: 0 @ 0 ] ].
								event target
									zIndex: 0;
									removeAptitude: (event target userData at: #typDynAptitude);
									background: Color transparent;
									geometry: (BlRoundedRectangleGeometry cornerRadius: 2) ];
						yourself ];
				with: value.
			aMondrian layout grid
				cellSpacing: 0;
				columnCount: value size sqrt ceiling.
			(aMondrian topStep root parent childNamed: #label)
				visibility: BlVisibility gone.
			aMondrian topStep root
				when: BlMouseEnterEvent
					do: [ :event | 
						(event target parent childNamed: #label) visibility: BlVisibility visible.
						event target
							childrenDo: [ :c | c graph model ifNotNil: [ :m | (c childNamed: #icon) geometry: m typGtGeometry ] ].
						event target parent
							aptitude: BrShadowAptitude;
							zIndex: 2;
							transformDo: [ :t | t scaleBy: 2.2 ].
						event target
							layout: (BlOnceLayout
									on: (event target layout layout
											cellSpacing: 2;
											yourself)) ];
				when: BlMouseLeaveEvent
					do: [ :event | 
						(event target parent childNamed: #label) visibility: BlVisibility gone.
						event target
							childrenDo: [ :c | 
								c graph model
									ifNotNil: [ :m | (c childNamed: #icon) geometry: BlRectangleGeometry new ] ].
						event target parent
							removeAptitude: event target parent aptitude;
							zIndex: 1;
							transformDo: [ :t | t scaleBy: 1 ].
						event target
							layout: (BlOnceLayout
									on: (event target layout layout
											cellSpacing: 0;
											yourself)) ].
			^ self ].
	value isDictionary
		ifTrue: [ self
				typGtMondrianKey: key
				dictionary: value
				in: aMondrian.
			^ self ].
	self error
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
						v := partition at: TypDynVariable ifAbsent: [ 0 ].
						m := partition at: TypDynArgument ifAbsent: [ 0 ].
						'{1}|{2}% variables, {3}|{4}% methods'
							format: {v.
									(100 * v / (whole at: TypDynVariable)) asInteger.
									m.
									(100 * m / (whole at: TypDynArgument)) asInteger} ]
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
