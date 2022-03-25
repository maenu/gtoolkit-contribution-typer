Extension { #name : #CleanBlockClosure }

{ #category : #'*Typer-Inference' }
CleanBlockClosure >> readsRef: aVariable [

	^ false
]

{ #category : #'*Typer-Inference' }
CleanBlockClosure >> writesField: varIndex [ 
	^self compiledBlock writesField: varIndex
]

{ #category : #'*Typer-Inference' }
CleanBlockClosure >> writesRef: aClassVariable [

	^ false
]
