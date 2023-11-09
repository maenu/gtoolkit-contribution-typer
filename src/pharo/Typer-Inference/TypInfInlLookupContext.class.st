Class {
	#name : #TypInfInlLookupContext,
	#superclass : #TypInfInlContext,
	#category : #'Typer-Inference-Core'
}

{ #category : #testing }
TypInfInlLookupContext >> install [
	self assert: [ root isNil ].
	self assert: [ current isNil ].
	sender children add: self.
	current := root := self add: (TypInfInlLookupMessage node: node context: self).
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
		inReceiver: message inReceiver;
		inArguments: message inArguments.
	message outNextDisabledsEnableOn: root
]

{ #category : #accessing }
TypInfInlLookupContext >> noMethod [
	"nothing found"

	
]

{ #category : #testing }
TypInfInlLookupContext >> stackSize [
	^ sender stackSize
]
