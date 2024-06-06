from setuptools import find_packages,setup
from typing import List


# i can also use .sh file to do this
HYPEN_E_DOT="-e ."
def get_requirements(file_path:str)->List[str]:
    '''
    this funciton will return the list of requirements

    
    '''
    requirements=[]

    with open(file_path) as file_obj:
        requirements=file_obj.readlines()
        [req.replace("\n","") for req in requirements]

        if HYPEN_E_DOT in requirements:
            requirements.remove(HYPEN_E_DOT)

    return requirements
setup(
    name='MLproject',
    version='0.0.1',
    author='Navneet',
    author_email='2022btechaidsnavneet11962@poornima.edu.in',
    packages=find_packages(),
    install_requires= get_requirements('requirements.txt')
)