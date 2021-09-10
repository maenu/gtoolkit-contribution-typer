Class {
	#name : #TypNode,
	#superclass : #Object,
	#instVars : [
		'dependencies',
		'dependents'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypNode >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject dependencies = dependencies ifFalse: [ ^ false ].
	anObject dependents = dependents ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypNode >> addDependency: aDependency [

	self assert: [ aDependency dependency includesDependent: aDependency ].
	self assert: [ aDependency dependent == self ].
	dependencies add: aDependency
]

{ #category : #accessing }
TypNode >> addDependent: aDependency [

	self assert: [ aDependency dependency == self ].
	dependents add: aDependency.
	^ aDependency dependent
		  addDependency: aDependency;
		  yourself
]

{ #category : #accessing }
TypNode >> addDependent: aNode label: aString [

	^ self addDependent: aNode label: aString data: nil
]

{ #category : #accessing }
TypNode >> addDependent: aNode label: aString data: anObject [

	^ self addDependent: (TypEdge
			   dependency: self
			   dependent: aNode
			   label: aString
			   data: anObject)
]

{ #category : #accessing }
TypNode >> dependencies [

	^ dependencies
]

{ #category : #accessing }
TypNode >> dependents [

	^ dependents
]

{ #category : #accessing }
TypNode >> gtGraphOn: aView [

	<gtView>
	^ aView mondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | 
			  | nodes edges remains |
			  nodes := IdentitySet new.
			  edges := IdentitySet new.
			  remains := OrderedCollection with: self.
			  [ remains isEmpty ] whileFalse: [ 
					  | current |
					  current := remains removeLast.
					  nodes add: current.
					  current dependencies do: [ :e | 
							  edges add: e.
							  (nodes includes: e dependency) ifFalse: [ 
									  remains add: e dependency ] ] ].
			  m nodes
				  stencil: [ :e | 
					  BlShrinkingTextElement new
						  constraintsDo: [ :c | 
							  c horizontal exact: 100.
							  c vertical exact: 15 ];
						  text: e asString asRopedText;
						  background: (e == self
								   ifTrue: [ Color orange alpha: 0.5 ]
								   ifFalse: [ Color transparent ]);
						  yourself ];
				  with: nodes.
			  m edges
				  fromNearestBounds;
				  toNearestBounds;
				  stencil: [ :e | 
					  BlParabollaArcElement new
						  when: BlClickEvent do: [ :f | 
							  f consumed: true.
							  f target phlow spawnObject: e ];
						  addChild: (BlShrinkingTextElement new
								   constraintsDo: [ :c | 
									   c horizontal exact: 100.
									   c vertical exact: 15 ];
								   text: e label asRopedText;
								   yourself);
						  zIndex: -1;
						  curvatureFraction: 0.3;
						  border: (BlBorder paint: (Color orange alpha: 0.5) width: 2);
						  toHead: (BlArrowheadSimpleArrow new border: (BlBorder builder
									    paint: (Color orange alpha: 0.5);
									    width: 2;
									    build)) ];
				  connect: edges from: #dependency to: #dependent.
			  m layout force charge: -50000.
			  m ]
]

{ #category : #accessing }
TypNode >> hash [

	^ dependencies hash bitXor: dependents hash
]

{ #category : #accessing }
TypNode >> includesDependency: aDependency [

	^ dependencies includes: aDependency
]

{ #category : #accessing }
TypNode >> includesDependent: aDependency [

	^ dependents includes: aDependency
]

{ #category : #accessing }
TypNode >> initialize [

	super initialize.
	dependencies := IdentitySet new.
	dependents := IdentitySet new
]

{ #category : #accessing }
TypNode >> postCopy [

	super postCopy.
	dependencies := IdentitySet new.
	dependents := IdentitySet new
]
