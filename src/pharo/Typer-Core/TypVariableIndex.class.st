Class {
	#name : #TypVariableIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              initializeResolver: (TypDepthFirstResolver resolver:
						               (TypBreadthFirstResolver resolvers: { 
									                TypPraVariableResolver new.
									                TypShaVariableResolver new.
									                TypInfVariableResolver new }));
			              yourself ]
]

{ #category : #printing }
TypVariableIndex >> printOn: aStream [

	aStream nextPutAll: 'variables'
]
