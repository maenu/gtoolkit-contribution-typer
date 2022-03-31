Class {
	#name : #TypDynReport,
	#superclass : #Object,
	#instVars : [
		'package',
		'variables',
		'methods'
	],
	#category : #'Typer-Dynamic'
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
	methods := methods collect: [ :e | e collect: #typAsType ]
]

{ #category : #'as yet unclassified' }
TypDynReport >> typGtIndexFor: aView [

	"<gtView>"

	self flag: 'too expensive'.
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

{ #category : #'as yet unclassified' }
TypDynReport >> typGtSummaryFor: aView [

	<gtView>
	^ aView forward
		  title: 'Summary';
		  priority: 10;
		  object: [ 
			  ((variables associations flatCollect: [ :a | 
					    a value associations collect: [ :b | 
							    b value -> (a key -> b key) ] ]) groupedBy: #key) collect: [ 
					  :c | c collect: #value ] ];
		  view: #gtItemsFor:
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
