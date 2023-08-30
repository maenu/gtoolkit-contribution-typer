Class {
	#name : #TypInfInlineLookupContext,
	#superclass : #TypInfInlineContext,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlineLookupContext >> canInstall [
	^ message lookup preResolve isNotEmpty
]

{ #category : #accessing }
TypInfInlineLookupContext >> newRoot [
	^ TypInfInlinedLookupMessage node: node context: self
]

{ #category : #accessing }
TypInfInlineLookupContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
		inReceiver: message inReceiver;
		inArguments: message inArguments.
	root
		outAdd: (TypInfNextEdge origin: root target: (message outAt: #nextOriginal))
]
