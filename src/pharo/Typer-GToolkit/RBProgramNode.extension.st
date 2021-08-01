Extension { #name : #RBProgramNode }

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtCanType [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtInvokedMethods [
	^ self children flatCollect: #typGtInvokedMethods as: IdentitySet
]

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtSelf [

	parent ifNotNil: [ ^ parent typGtSelf ].
	^ self
		  propertyAt: 'typGtSelf'
		  ifAbsent: [ self propertyAt: 'typGtSelf' put: self typInfUnknown ]
]
