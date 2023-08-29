Class {
	#name : #TypInfLookupMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLookupMessageStrategy >> canInstall [
	^ message inReceiver
		canResolve: self constrainedReceiver
		method: message selector asSymbol
		arguments: message arguments
]

{ #category : #accessing }
TypInfLookupMessageStrategy >> transfer [
	| method |
	method := message inReceiver
			resolve: self constrainedReceiver
			method: message selector asSymbol
			arguments: message arguments.
	message inArguments
		withIndexDo: [ :e :i | 
			i <= method arguments size
				ifTrue: [ message constrain: e to: (method arguments at: i) ] ].
	message state at: message put: method result
]
