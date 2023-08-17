Class {
	#name : #TypInfLookupMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLookupMessageStrategy >> canInstall [
	^ (message inReceiver
		lookup: self constrainedReceiver
		method: message selector asSymbol
		arguments: message arguments) isUnknown not
]

{ #category : #accessing }
TypInfLookupMessageStrategy >> transfer [
	| method |
	method := message inReceiver
			lookup: self constrainedReceiver
			method: message selector asSymbol
			arguments: message arguments.
	message inArguments
		withIndexDo: [ :e :i | 
			i <= method arguments size
				ifTrue: [ message constrain: e to: (method arguments at: i) ] ].
	message state at: message covariantPut: method result
]
