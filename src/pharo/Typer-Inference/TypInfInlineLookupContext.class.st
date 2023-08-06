Class {
	#name : #TypInfInlineLookupContext,
	#superclass : #TypInfInlineContext,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlineLookupContext >> canInstall [
	^ selfType canLookupMethod: message selector
]

{ #category : #accessing }
TypInfInlineLookupContext >> newRoot [
	^ TypInfInlinedLookupMessage node: node context: self
]

{ #category : #accessing }
TypInfInlineLookupContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
		inReceiver: message receiver;
		inArguments: message arguments.
	message
		outAt: #nextOriginal
		ifPresent: [ :n | current outAdd: (TypInfNextEdge origin: current target: n) ]
		ifAbsent: [  "noop" ]
]
