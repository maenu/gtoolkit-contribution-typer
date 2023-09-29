Extension { #name : #RPackage }

{ #category : #'*Typer-Coverage' }
RPackage >> typGtCovFor: aView context: aDictionary [

	<gtPackageView>
	^ aView explicit
		  title: 'Coverage';
		  priority: 50;
		  stencil: [ 
			  BlElement new
				  layout: BlLinearLayout vertical;
				  constraintsDo: [ :c | 
					  c horizontal fitContent.
					  c vertical fitContent ];
				  addChildren: { 
						  (BrLabel new
							   aptitude: BrGlamorousLabelLook;
							   text: 'methods';
							   yourself).
						  self typGtCovMethod typGtCovAsElement.
						  (BrLabel new
							   aptitude: BrGlamorousLabelLook;
							   text: 'nodes';
							   yourself).
						  self typGtCovNode typGtCovAsElement };
				  yourself ];
		  yourself
]

{ #category : #'*Typer-Coverage' }
RPackage >> typGtCovMethod [
	^ (self methods
		groupedBy: [ :e | 
			ASTCache default
				at: e
				ifPresent: [ :f | f propertyAt: #tagExecuted ifAbsent: [ nil ] ]
				ifAbsent: [ nil ] ]) asDictionary
]

{ #category : #'*Typer-Coverage' }
RPackage >> typGtCovNode [
	^ ((self methods flatCollect: [ :e | e ast allChildren , {e ast} ])
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]
