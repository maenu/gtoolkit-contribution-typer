Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Inference' }
RBCascadeNode >> typInfSignalsAlways [
	^ self messages anySatisfy: [ :e | e typInfSignalsAlways = true ]
]

{ #category : #'*Typer-Inference' }
RBCascadeNode >> typInfTypeRecursive [
	^ (self messages collect: #typInfType) last
]
