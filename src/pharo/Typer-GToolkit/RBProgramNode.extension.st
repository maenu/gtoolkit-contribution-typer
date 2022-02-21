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
RBProgramNode >> typGtNodeFor: aView [

	<gtView>
	^ aView forward
		  title: 'Typer Graph';
		  priority: 10;
		  object: [ TypInfFlowNode node: self ];
		  view: #typGtGraphFor:
]
