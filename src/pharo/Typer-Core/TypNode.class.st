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
TypNode >> asElementIn: aMondrian [

	^ BrButton new
		  aptitude: BrGlamorousButtonWithLabelAptitude
			  + BrGlamorousFocusableShadowAptitude
			  + ((BrGlamorousWithTooltipAptitude content: [ 
						    BrToolbar new
							    aptitude: BrGlamorousToolbarAptitude;
							    addItem: (BrButton new
									     aptitude: BrGlamorousButtonWithLabelAptitude;
									     label: ('dependents {1}' format: { dependents size });
									     action: [ 
										     | nodes edges |
										     nodes := dependents collect: #dependent.
										     edges := dependents copy.
										     aMondrian nodes
											     stencil: [ :e | e asElementIn: aMondrian ];
											     with: nodes.
										     aMondrian edges
											     stencil: [ :e | e asElementIn: aMondrian ];
											     connect: edges from: #dependency to: #dependent.
										     aMondrian layout custom: TypGtGraphForceBasedLayout new ];
									     yourself);
							    addItem: (BrButton new
									     aptitude: BrGlamorousButtonWithLabelAptitude;
									     label:
										     ('dependencies {1}' format: { dependencies size });
									     action: [ 
										     | nodes edges |
										     nodes := dependencies collect: #dependency.
										     edges := dependencies copy.
										     aMondrian nodes
											     stencil: [ :e | e asElementIn: aMondrian ];
											     with: nodes.
										     aMondrian edges
											     stencil: [ :e | e asElementIn: aMondrian ];
											     connect: edges from: #dependency to: #dependent.
										     aMondrian layout custom: TypGtGraphForceBasedLayout new ];
									     yourself);
							    yourself ])
					   showDelay: 100 milliSeconds;
					   hideDelay: 100 milliSeconds;
					   yourself);
		  label: self asString;
		  action: [ :e | e phlow spawnObject: self ];
		  yourself
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
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | 
			  | nodes edges |
			  nodes := IdentitySet new.
			  edges := IdentitySet new.
			  self withAllDependencies do: [ :e | 
					  nodes add: e.
					  edges addAll: e dependents ].
			  self withAllDependents do: [ :e | 
					  nodes add: e.
					  edges addAll: e dependencies ].
			  m nodes
				  stencil: [ :e | e asElementIn: m ];
				  with: nodes.
			  m edges
				  stencil: [ :e | e asElementIn: m ];
				  connect: edges from: #dependency to: #dependent.
			  m layout custom: TypGtGraphForceBasedLayout new.
			  m ]
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
	dependencies := Set new.
	dependents := Set new
]

{ #category : #accessing }
TypNode >> postCopy [

	super postCopy.
	dependencies := IdentitySet new.
	dependents := IdentitySet new
]

{ #category : #accessing }
TypNode >> removeAllDependents [

	dependents copy do: [ :e | self removeDependent: e ]
]

{ #category : #accessing }
TypNode >> removeDependency: aDependency [

	self assert: [ dependencies includes: aDependency ].
	self assert: [ 
		(aDependency dependency includesDependent: aDependency) not ].
	dependencies remove: aDependency
]

{ #category : #accessing }
TypNode >> removeDependent: aDependency [

	self assert: [ dependents includes: aDependency ].
	dependents remove: aDependency.
	^ aDependency dependent
		  removeDependency: aDependency;
		  yourself
]

{ #category : #accessing }
TypNode >> withAllDependencies [

	| nodes remains |
	nodes := IdentitySet new.
	remains := Stack with: self.
	[ remains isEmpty ] whileFalse: [ 
		| current |
		current := remains pop.
		nodes add: current.
		current dependencies
			reject: [ :e | nodes includes: e dependency ]
			thenDo: [ :e | remains push: e dependency ] ].
	^ nodes
]

{ #category : #accessing }
TypNode >> withAllDependents [

	| nodes remains |
	nodes := IdentitySet new.
	remains := Stack with: self.
	[ remains isEmpty ] whileFalse: [ 
		| current |
		current := remains pop.
		nodes add: current.
		current dependents
			reject: [ :e | nodes includes: e dependent ]
			thenDo: [ :e | remains push: e dependent ] ].
	^ nodes
]
