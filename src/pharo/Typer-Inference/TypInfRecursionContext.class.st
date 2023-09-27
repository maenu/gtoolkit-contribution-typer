Class {
	#name : #TypInfRecursionContext,
	#superclass : #TypInfInlContext,
	#instVars : [
		'edge'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfRecursionContext >> install [
	self assert: [ root isNil ].
	self assert: [ current isNil ].
	sender children add: self.
	current := root := message recursiveContextOrNil root.
	edge := message outAdd: (TypInfNextEdge origin: message target: root)
]

{ #category : #accessing }
TypInfRecursionContext >> stackSize [
	^ sender stackSize
]

{ #category : #accessing }
TypInfRecursionContext >> uninstall [
	edge remove.
	super uninstall
]
