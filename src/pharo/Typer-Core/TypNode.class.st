Class {
	#name : #TypNode,
	#superclass : #Object,
	#instVars : [
		'incoming',
		'outgoing'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #invalidation }
TypNode class >> invalidateAll [

	<script>
	^ self allSubInstancesDo: #removeAllOutgoing
]

{ #category : #accessing }
TypNode >> addIncoming: anEdge [

	self assert: [ anEdge origin outgoing includes: anEdge ].
	incoming add: anEdge
]

{ #category : #accessing }
TypNode >> addOutgoing: anEdge [

	self assert: [ anEdge origin == self ].
	outgoing add: anEdge.
	^ anEdge target
		  addIncoming: anEdge;
		  yourself
]

{ #category : #accessing }
TypNode >> addOutgoingTarget: aNode data: anObject [

	^ self addOutgoing:
		  (TypEdge origin: self target: aNode data: anObject)
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
									     label: ('out {1}' format: { outgoing size });
									     action: [ 
										     | nodes edges |
										     nodes := outgoing collect: #target.
										     edges := outgoing copy.
										     aMondrian nodes
											     stencil: [ :e | e asElementIn: aMondrian ];
											     with: nodes.
										     aMondrian edges
											     stencil: [ :e | e asElementIn: aMondrian ];
											     connect: edges from: #origin to: #target.
										     aMondrian layout custom: TypGtGraphForceBasedLayout new ];
									     yourself);
							    addItem: (BrButton new
									     aptitude: BrGlamorousButtonWithLabelAptitude;
									     label:
										     ('in {1}' format: { incoming size });
									     action: [ 
										     | nodes edges |
										     nodes := incoming collect: #origin.
										     edges := incoming copy.
										     aMondrian nodes
											     stencil: [ :e | e asElementIn: aMondrian ];
											     with: nodes.
										     aMondrian edges
											     stencil: [ :e | e asElementIn: aMondrian ];
											     connect: edges from: #origin to: #target.
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
TypNode >> incoming [

	^ incoming
]

{ #category : #accessing }
TypNode >> initialize [

	super initialize.
	incoming := Set new.
	outgoing := Set new
]

{ #category : #accessing }
TypNode >> outgoing [

	^ outgoing
]

{ #category : #accessing }
TypNode >> postCopy [

	super postCopy.
	incoming := IdentitySet new.
	outgoing := IdentitySet new
]

{ #category : #accessing }
TypNode >> removeAllOutgoing [

	outgoing copy do: [ :e | self removeOutgoing: e ]
]

{ #category : #accessing }
TypNode >> removeIncoming: anEdge [

	self assert: [ (anEdge origin outgoing includes: anEdge) not ].
	incoming remove: anEdge
]

{ #category : #accessing }
TypNode >> removeOutgoing: anEdge [

	outgoing remove: anEdge.
	^ anEdge target
		  removeIncoming: anEdge;
		  yourself
]

{ #category : #accessing }
TypNode >> withAllIncoming [

	| nodes remains |
	nodes := IdentitySet new.
	remains := Stack with: self.
	[ remains isEmpty ] whileFalse: [ 
		| current |
		current := remains pop.
		nodes add: current.
		current incoming
			reject: [ :e | nodes includes: e origin ]
			thenDo: [ :e | remains push: e origin ] ].
	^ nodes
]

{ #category : #accessing }
TypNode >> withAllOutgoing [

	| nodes remains |
	nodes := IdentitySet new.
	remains := Stack with: self.
	[ remains isEmpty ] whileFalse: [ 
		| current |
		current := remains pop.
		nodes add: current.
		current outgoing
			reject: [ :e | nodes includes: e target ]
			thenDo: [ :e | remains push: e target ] ].
	^ nodes
]
