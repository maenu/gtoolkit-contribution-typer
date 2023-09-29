Class {
	#name : #TypDynReport,
	#superclass : #Object,
	#instVars : [
		'package',
		'variables',
		'methods'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #'as yet unclassified' }
TypDynReport class >> package: aPackage variable: aBlock method: anotherBlock [

	^ self new
		  initializePackage: aPackage variable: aBlock method: anotherBlock;
		  yourself
]

{ #category : #initialization }
TypDynReport >> initializePackage: aPackage variable: aBlock method: anotherBlock [

	package := aPackage.
	variables := ((package definedClasses asIdentitySet flatCollect: [ :c | 
		               c instanceVariables , c classVariables
		               , c classSide instanceVariables ]) groupedBy:
		              #owningClass) collect: [ :c | 
		             c
			             collect: [ :v | v name asSymbol -> (aBlock cull: v) ]
			             as: IdentityDictionary ].
	methods := (package methods asIdentitySet groupedBy: #methodClass) 
		           collect: [ :c | 
			           c
				           collect: [ :m | m selector -> (anotherBlock cull: m) ]
				           as: IdentityDictionary ]
]

{ #category : #accessing }
TypDynReport >> items [

	^ (variables values flatCollect: #values)
	  , (methods values flatCollect: #values)
]

{ #category : #accessing }
TypDynReport >> methodAt: aMethod [

	| clazz |
	clazz := methods
		         at: aMethod methodClass
		         ifAbsent: [ ^ LinkedList new ].
	^ clazz at: aMethod selector
]

{ #category : #'as yet unclassified' }
TypDynReport >> methodRows [

	^ variables associations flatCollect: [ :a | 
		  a value associations collect: [ :b | 
			  OrderedCollection withAll: { 
					  a key.
					  b key.
					  b value } ] ]
]

{ #category : #'as yet unclassified' }
TypDynReport >> package [

	^ package
]

{ #category : #'truncation and round off' }
TypDynReport >> reduce [

	variables := variables collect: [ :e | e collect: #typAsType ].
	methods keysAndValuesDo: [ :c :ms | 
		ms keysAndValuesDo: [ :s :l | 
			l ifEmpty: [ 
				l add: (CompiledMethod
						 typAsFunctionTypeWithResult: TypUnknownType instance
						 arguments:
						 ((1 to: (c >> s) numArgs) collect: [ :i | TypUnknownType instance ])) ] ] ].
	methods := methods collect: [ :e | e collect: #typAsType ]
]

{ #category : #'as yet unclassified' }
TypDynReport >> typGtIndexFor: aView [

	"<gtView>"

	| report |
	self flag: 'FIXME report, too expensive'.
	^ aView mondrian
		  title: 'Index' translated;
		  priority: 51;
		  painting: [ :m | 
			  | ms vs cs |
			  ms := IdentitySet new.
			  vs := IdentitySet new.
			  cs := IdentitySet new.
			  report associationsDo: [ :a | 
					  (a key isKindOf: CompiledMethod) ifTrue: [ 
							  cs add: a key methodClass.
							  ms add: a ].
					  (a isKindOf: Variable) ifTrue: [ 
							  cs add: a key owningClass.
							  vs add: a ] ].
			  m nodes
				  stencil: [ :e | 
					  BlElement new
						  geometry: BlCircleGeometry new;
						  size: 5 @ 5;
						  background: (e value isUnknown
								   ifTrue: [ Color green ]
								   ifFalse: [ Color green alpha: 0.5 ]);
						  yourself ];
				  with: ms;
				  stencil: [ :e | 
					  BlElement new
						  geometry: BlCircleGeometry new;
						  size: 5 @ 5;
						  background: (e value isUnknown
								   ifTrue: [ Color orange ]
								   ifFalse: [ Color orange alpha: 0.5 ]);
						  yourself ];
				  with: vs;
				  stencil: [ :e | 
					  BlElement new
						  geometry: BlCircleGeometry new;
						  size: 5 @ 5;
						  background: Color blue;
						  yourself ];
				  with: cs.
			  m edges
				  connect: ms from: [ :e | e key methodClass ];
				  connect: vs from: [ :e | e key owningClass ].
			  m layout force charge: -2000 ];
		  yourself
]

{ #category : #'as yet unclassified' }
TypDynReport >> typGtMethodsFor: aView [

	<gtView>
	^ aView forward
		  title: 'Methods';
		  priority: 10;
		  object: [ methods ];
		  view: #gtItemsFor:
]

{ #category : #accessing }
TypDynReport >> typGtSummaryFor: aView context: aContext [

	<gtView>
	| whole |
	whole := (self items groupedBy: #class) collect: #size.
	^ aView columnedTree
		  title: 'Tree';
		  priority: 51;
		  items: [ 
			  GtTreeNode fromCollection:
					  (((self items groupedBy: #rank) associations sorted: [ :a :b | 
							    a key < b key ]) as: OrderedDictionary) ];
		  children: [ :n | 
			  (n value isCollection and: [ n value isString not ])
				  ifTrue: [ GtTreeNode fromNode: n ]
				  ifFalse: [ #(  ) ] ];
		  actionUpdateButtonTooltip: 'Update tree';
		  column: 'Index' text: [ :n | 
			  (n value isCollection
				   ifTrue: [ n key gtDisplayText ]
				   ifFalse: [ 
					   '{1} {2}/{3}' format: { 
								   n parent key gtDisplayText.
								   n key asString.
								   n parent value size asString } ]) asRopedText foreground:
					  Color gray ]
		  weight: 1;
		  column: 'dyn' text: [ :n | 
			  n value isCollection
				  ifTrue: [ 
					  | partition v m |
					  partition := (n value groupedBy: #class) collect: #size.
					  v := partition at: TypDynReportVariableItem ifAbsent: [ 0 ].
					  m := partition at: TypDynReportMethodItem ifAbsent: [ 0 ].
					  '{1}|{2}% variables, {3}|{4}% methods' format: { 
								  v.
								  (100 * v / (whole at: TypDynReportVariableItem)) asInteger.
								  m.
								  (100 * m / (whole at: TypDynReportMethodItem)) asInteger } ]
				  ifFalse: [ n value dyn asString ] ]
		  weight: 1;
		  column: 'inf' text: [ :n | 
			  n value isCollection
				  ifTrue: [ '' ]
				  ifFalse: [ n value inf asString ] ]
		  weight: 1;
		  column: 'dynReduced' text: [ :n | 
			  (n value isCollection or: [ n value dyn = n value dynReduced ])
				  ifTrue: [ '' ]
				  ifFalse: [ n value dynReduced asString ] ]
		  weight: 1;
		  column: 'infReduced' text: [ :n | 
			  (n value isCollection or: [ n value inf = n value infReduced ])
				  ifTrue: [ '' ]
				  ifFalse: [ n value infReduced asString ] ]
		  weight: 1;
		  send: #value
]

{ #category : #'as yet unclassified' }
TypDynReport >> typGtVariablesFor: aView [

	<gtView>
	^ aView forward
		  title: 'Variables';
		  priority: 10;
		  object: [ variables ];
		  view: #gtItemsFor:
]

{ #category : #accessing }
TypDynReport >> variableAt: aVariable [

	| clazz |
	clazz := variables
		         at: aVariable owningClass
		         ifAbsent: [ ^ LinkedList new ].
	^ clazz at: aVariable name asSymbol
]

{ #category : #'as yet unclassified' }
TypDynReport >> variableRows [

	^ variables associations flatCollect: [ :a | 
		  a value associations collect: [ :b | 
			  OrderedCollection withAll: { 
					  a key.
					  b key.
					  b value } ] ]
]
