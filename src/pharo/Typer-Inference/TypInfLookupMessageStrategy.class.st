Class {
	#name : #TypInfLookupMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLookupMessageStrategy >> canInstall [
	^ (message receiver
		lookupMethod: message selector asSymbol
		arguments: message arguments) isUnknown not
]

{ #category : #accessing }
TypInfLookupMessageStrategy >> transfer [
	| method |
	method := message receiver
			lookupMethod: message selector asSymbol
			arguments: message arguments.
	message inArguments
		withIndexDo: [ :e :i | 
			i <= method arguments size
				ifTrue: [ message state at: e covariantPut: (method arguments at: i) ] ].
	message state at: message covariantPut: method result
]
