Class {
	#name : #TypInfInlLookupContext,
	#superclass : #TypInfInlContext,
	#category : #'Typer-Inference-Inline'
}

{ #category : #accessing }
TypInfInlLookupContext >> canInstall [
	^ message lookup preResolve isNotEmpty
]

{ #category : #accessing }
TypInfInlLookupContext >> newRoot [
	^ TypInfInlLookupMessage node: node context: self
]

{ #category : #accessing }
TypInfInlLookupContext >> stackSize [
	^ sender stackSize
]

{ #category : #accessing }
TypInfInlLookupContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
		inReceiver: message inReceiver;
		inArguments: message inArguments.
	message outEnableOrigin: root
]
